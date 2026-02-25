import 'package:get/get.dart';
import '../models/expense.dart';
import '../services/expense_storage.dart';
import '../models/category_limits.dart';

class ExpenseController extends GetxController {
  final ExpenseStorage storage;

  ExpenseController(this.storage);

  final RxList<Expense> expenses = <Expense>[].obs;

  @override
  void onInit() {
    loadExpenses();
    super.onInit();
  }

  void loadExpenses() {
    expenses.assignAll(storage.getAll());
  }

  Future<void> addExpense(String title, double amount, String category) async {
    final expense = Expense(title, amount, category, DateTime.now());
    await storage.add(expense);
    loadExpenses();
  }

  Future<void> deleteExpense(int index) async {
    await storage.deleteAt(index);
    loadExpenses();
  }

  // CATEGORY HELPERS
  List<String> get categories =>
      expenses.map((e) => e.category).toSet().toList();

  List<Expense> byCategory(String category) {
    return expenses.where((e) => e.category == category).toList();
  }

  double totalForCategory(String category) {
    return expenses
        .where((e) => e.category == category)
        .fold(0.0, (sum, e) => sum + e.amount);
  }

  double limitForCategory(String category) {
    return categoryLimits
        .firstWhere(
          (c) => c.name == category,
          orElse: () => const CategoryLimit("", 0),
        )
        .limit;
  }

  bool exceeded(String category) {
    final limit = limitForCategory(category);
    if (limit == 0) return false;
    return totalForCategory(category) > limit;
  }

  // Returns a map of category name, total spent
  Map<String, double> categoryTotals() {
    final totals = <String, double>{};

    for (final e in expenses) {
      totals[e.category] = (totals[e.category] ?? 0) + e.amount;
    }

    return totals;
  }
}
