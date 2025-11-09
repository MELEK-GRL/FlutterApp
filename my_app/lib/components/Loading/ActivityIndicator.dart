import 'package:flutter/material.dart';
import 'package:my_app/utils/Theme/theme.dart';

class Activityindicator extends StatefulWidget {
  const Activityindicator({super.key});

  @override
  State<Activityindicator> createState() => _ActivityindicatorState();
}

class _ActivityindicatorState extends State<Activityindicator> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: MainColors.red.base,
      backgroundColor: MainColors.red.base.withValues(alpha: 0.2),
    );
  }
}
