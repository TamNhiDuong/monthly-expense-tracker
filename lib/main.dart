import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app_router.dart';
import 'controllers/expense_controller.dart';
import 'services/expense_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  final storage = ExpenseStorage();
  await storage.init();

  Get.put(ExpenseController(storage));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Monthly Expense Tracker",
      initialRoute: '/',
      getPages: AppRouter.routes,
    );
  }
}
