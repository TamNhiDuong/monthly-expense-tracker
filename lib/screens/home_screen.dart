import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';
import '../widgets/responsive_container.dart';

class HomeScreen extends StatelessWidget {
  final controller = Get.find<ExpenseController>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Monthly Expenses"),
        actions: [
          IconButton(
            onPressed: () => Get.toNamed('/stats'),
            icon: const Icon(Icons.bar_chart),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed('/add'),
        child: const Icon(Icons.add),
      ),
      body: ResponsiveContainer(
        child: Obx(
          () => ListView(
            children: controller.categories
                .map(
                  (c) => ListTile(
                    title: Text(c),
                    onTap: () => Get.toNamed('/category/$c'),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
