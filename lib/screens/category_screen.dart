import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';

class CategoryScreen extends StatelessWidget {
  final controller = Get.find<ExpenseController>();

  CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = Get.parameters['name']!;

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Obx(() {
        final items = controller.byCategory(category);

        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(items[i].title),
            trailing: Text("€${items[i].amount.toStringAsFixed(2)}"),
            onLongPress: () => controller.deleteExpense(i),
          ),
        );
      }),
    );
  }
}
