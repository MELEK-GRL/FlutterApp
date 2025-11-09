import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/components/Loading/ActivityIndicator.dart';
import 'package:my_app/components/Texts/T.dart';
import 'package:my_app/utils/Theme/theme.dart';

class Listlayout extends StatefulWidget {
  const Listlayout({
    super.key,
    this.itemCount,
    this.title,
    this.subtitle,
    this.data,
    this.onTapFunc,
    this.imageUrls,
    this.detail,
    this.info,
    this.rightText,
  });

  final int? itemCount;
  final List? title;
  final List? subtitle;
  final List? info;
  final List? data;
  final List? imageUrls;
  final bool? detail;
  final bool? rightText;
  final void Function(int index)? onTapFunc;

  @override
  State<Listlayout> createState() => _ListlayoutState();
}

class _ListlayoutState extends State<Listlayout> {
  @override
  Widget build(BuildContext context) {
    if (widget.data == null) {
      return const Center(child: T(text: 'Veri Bulunmamaktadır'));
    }
    if (widget.data!.isEmpty) {
      return const Center(child: Activityindicator());
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListView.separated(
        itemCount: widget.itemCount ?? 0,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              widget.onTapFunc!(index);
            },
            borderRadius: BorderRadius.circular(12),
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
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Row(
                children: [
                  widget.imageUrls != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            widget.imageUrls?[index] ?? '',
                            width: 50,
                            height: 70,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              width: 50,
                              height: 70,
                              decoration: BoxDecoration(color: Colors.black),
                            ),
                          ),
                        )
                      : SizedBox.shrink(),

                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        T(
                          text: widget.title?[index] ?? '',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                        const SizedBox(height: 4),
                        T(
                          text: widget.subtitle?[index] ?? '',
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ),
                  widget.detail == true
                      ? const Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey,
                        )
                      : const SizedBox.shrink(),

                  widget.rightText == true
                      ? T(
                          text: 'IMDB: ' + (widget.info?[index] ?? ''),
                          fontSize: 14,
                          color: Colors.grey,
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
