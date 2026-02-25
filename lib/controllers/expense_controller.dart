import 'package:get/get.dart';
import '../models/expense.dart';
import '../services/expense_storage.dart';

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

  List<String> get categories =>
      expenses.map((e) => e.category).toSet().toList();

  List<Expense> byCategory(String category) =>
      expenses.where((e) => e.category == category).toList();

  Map<String, double> categoryTotals() {
    final totals = <String, double>{};

    for (final e in expenses) {
      totals[e.category] = (totals[e.category] ?? 0) + e.amount;
    }
    return totals;
  }
}
