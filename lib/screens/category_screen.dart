import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final controller = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    // Get category name from path parameter
    final category = Uri.decodeComponent(Get.parameters['name'] ?? '');

    return Scaffold(
      appBar: AppBar(title: Text(category)),
      body: Obx(() {
        final expenses = controller.byCategory(category);
        final total = controller.totalForCategory(category);
        final limit = controller.limitForCategory(category);
        final exceeded = controller.exceeded(category);

        return Column(
          children: [
            // show total and limit at top
            Container(
              width: double.infinity,
              color: exceeded
                  ? Colors.red.withOpacity(0.2)
                  : Colors.green.withOpacity(0.2),
              padding: const EdgeInsets.all(16),
              child: Text(
                limit > 0
                    ? "Total: €${total.toStringAsFixed(2)} / €$limit"
                    : "Total: €${total.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  final e = expenses[index];
                  return ListTile(
                    title: Text(e.title),
                    subtitle: Text(
                      "${e.date.day}/${e.date.month}/${e.date.year}",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("€${e.amount.toStringAsFixed(2)}"),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.delete_outline),
                          color: Colors.red,
                          onPressed: () {
                            controller.deleteExpense(
                              controller.expenses.indexOf(e),
                            );

                            Get.snackbar(
                              "Deleted",
                              "Expense '${e.title}' removed",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
