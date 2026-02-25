import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';
import '../models/category_limits.dart';

class AddExpenseScreen extends StatelessWidget {
  AddExpenseScreen({super.key});

  final titleCtrl = TextEditingController();
  final amountCtrl = TextEditingController();

  final controller = Get.find<ExpenseController>();

  final RxString selectedCategory = categoryLimits.first.name.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Expense")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleCtrl,
              decoration: const InputDecoration(labelText: "Title"),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: amountCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Amount"),
            ),

            const SizedBox(height: 12),

            // CATEGORY DROPDOWN
            Obx(
              () => DropdownButtonFormField<String>(
                value: selectedCategory.value,
                items: categoryLimits
                    .map(
                      (c) => DropdownMenuItem(
                        value: c.name,
                        child: Text(
                          "${c.name}  (${c.limit == 0 ? "No limit" : "${c.limit} €"})",
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  selectedCategory.value = value!;
                },
                decoration: const InputDecoration(labelText: "Category"),
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                final amount = double.tryParse(amountCtrl.text);

                if (titleCtrl.text.isEmpty || amount == null) {
                  Get.snackbar("Error", "Please fill all fields");
                  return;
                }

                controller.addExpense(
                  titleCtrl.text,
                  amount,
                  selectedCategory.value,
                );

                // warning if exceeded
                if (controller.exceeded(selectedCategory.value)) {
                  Get.snackbar(
                    "Warning",
                    "Monthly limit exceeded!",
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                }

                Get.back();
              },
              child: const Text("Save Expense"),
            ),
          ],
        ),
      ),
    );
  }
}
