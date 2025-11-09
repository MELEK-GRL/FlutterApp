import 'package:flutter/material.dart';
import 'package:my_app/components/Texts/T.dart';

class Detailloyut extends StatefulWidget {
  const Detailloyut({
    super.key,
    this.detailDescription,
    this.detailName,
    this.detailImage,
  });
  final String? detailDescription;
  final String? detailName;
  final String? detailImage;
  @override
  State<Detailloyut> createState() => _DetailloyutState();
}

class _DetailloyutState extends State<Detailloyut> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.detailImage!,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 8),
                  T(
                    text: (widget.detailName).toString(),
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),

                  T(text: (widget.detailDescription).toString(), fontSize: 14),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
