import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';
import '../widgets/responsive_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<ExpenseController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monthly Expenses Tracker"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () => Get.toNamed('/stats'),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton.icon(
        onPressed: () => Get.toNamed('/add'),
        icon: const Icon(Icons.add),
        label: const Text("Add Expense"),
      ),
      body: ResponsiveContainer(
        child: Obx(
          () => ListView(
            children: controller.categories.map((c) {
              final spent = controller.totalForCategory(c);
              final limit = controller.limitForCategory(c);
              final exceeded = controller.exceeded(c);

              return ListTile(
                title: Text(c),
                subtitle: limit > 0
                    ? Text("${spent.toStringAsFixed(2)} / $limit €")
                    : const Text("No limit"),
                tileColor: exceeded ? Colors.red.withOpacity(0.2) : null,
                trailing: const Icon(Icons.arrow_forward),
                onTap: () => Get.toNamed('/category/${Uri.encodeComponent(c)}'),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
