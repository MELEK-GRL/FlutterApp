import 'package:flutter/material.dart';
import 'package:my_app/utils/Theme/theme.dart';

class BottomMenu extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onItemSelected;

  const BottomMenu({
    super.key,
    required this.currentIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    // print('--->currentIndex $currentIndex');
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemSelected,
      backgroundColor: Colors.white,
      selectedItemColor: MainColors.red.base,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Anasayfa'),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Finans'),
        BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmler'),
      ],
    );
  }
}
