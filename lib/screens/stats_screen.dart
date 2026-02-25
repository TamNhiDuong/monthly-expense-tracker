import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/expense_controller.dart';

class StatsScreen extends StatelessWidget {
  final controller = Get.find<ExpenseController>();

  StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Statistics")),
      body: Obx(() {
        final totals = controller.categoryTotals();

        return ListView(
          children: totals.entries
              .map(
                (e) => ListTile(
                  title: Text(e.key),
                  trailing: Text("€${e.value.toStringAsFixed(2)}"),
                ),
              )
              .toList(),
        );
      }),
    );
  }
}
