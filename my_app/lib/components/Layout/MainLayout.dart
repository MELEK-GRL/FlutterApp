import 'package:flutter/material.dart';
import 'package:my_app/components/bottom_menu.dart';
import 'package:my_app/utils/Theme/theme.dart';

class MainLayout extends StatelessWidget {
  final String title;
  final Widget body;
  final int currentIndex;

  const MainLayout({
    super.key,
    required this.title,
    required this.body,
    required this.currentIndex,
  });

  void _onMenuTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/finance');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/movieIMdb');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MainColors.red.base,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: body,
      bottomNavigationBar: BottomMenu(
        currentIndex: currentIndex,
        onItemSelected: (index) => _onMenuTap(context, index),
      ),
    );
  }
}
