import 'package:hive_flutter/hive_flutter.dart';
import '../models/expense.dart';

class ExpenseStorage {
  static const boxName = 'expensesBox';

  late Box box;

  Future init() async {
    box = await Hive.openBox(boxName);
  }

  List<Expense> getAll() {
    return box.values
        .map((e) => Expense.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  Future add(Expense expense) async {
    await box.add(expense.toJson());
  }

  Future deleteAt(int index) async {
    await box.deleteAt(index);
  }
}
