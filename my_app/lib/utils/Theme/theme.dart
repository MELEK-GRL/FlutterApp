import 'package:flutter/material.dart';

class MainColors {
  static const red = _RedColors();
  static const grey = _GreyColors();
}

class _RedColors {
  const _RedColors();

  final Color light = const Color(0xFFFFCDD2);
  final Color base = const Color(0xFFF71515);
  final Color dark = const Color(0xFFD32F2F);
}

class _GreyColors {
  const _GreyColors();

  final Color light = const Color(0xFFF5F5F5);
  final Color medium = const Color(0xFF9E9E9E);
  final Color dark = const Color(0xFF212121);
}
