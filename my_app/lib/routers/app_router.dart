import 'package:flutter/material.dart';
import 'package:my_app/screens/FinanceScreen/finance_screen.dart';
import 'package:my_app/screens/HomeScreen/home_screen.dart';
import 'package:my_app/screens/MovieIMdb/movieIMdb_screen.dart';

class AppRoutes {
  static const home = '/';
  static const finance = '/finance';
  static const list = '/movieIMdb';
}

class AppRouter {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.finance:
        return MaterialPageRoute(builder: (_) => const FinanceScreen());
      case AppRoutes.list:
        return MaterialPageRoute(builder: (_) => const MovieimdbScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('404 - Sayfa bulunamadı')),
          ),
        );
    }
  }
}
