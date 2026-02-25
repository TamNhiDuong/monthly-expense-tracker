import 'package:get/get.dart';
import 'screens/home_screen.dart';
import 'screens/add_expense_screen.dart';
import 'screens/category_screen.dart';
import 'screens/stats_screen.dart';

class AppRouter {
  static final routes = [
    GetPage(name: '/', page: () => HomeScreen()),
    GetPage(name: '/add', page: () => AddExpenseScreen()),
    GetPage(name: '/category/:name', page: () => CategoryScreen()),
    GetPage(name: '/stats', page: () => StatsScreen()),
  ];
}
