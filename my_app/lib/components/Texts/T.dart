import 'package:flutter/material.dart';

class T extends StatefulWidget {
  final String text;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final Color? color;

  const T({
    super.key,
    required this.text,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.fontWeight,
  });

  @override
  State<T> createState() => _TState();
}

class _TState extends State<T> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text ?? '',
      style: TextStyle(
        color: widget.color ?? const Color.fromARGB(255, 50, 49, 49),
        fontFamily: widget.fontFamily ?? 'Nunito',
        fontSize: widget.fontSize ?? 16,
        fontWeight: widget.fontWeight ?? FontWeight.normal,
      ),
    );
  }
}
