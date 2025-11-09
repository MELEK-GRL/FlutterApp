import 'package:flutter/material.dart';
import 'package:my_app/components/Layout/DetailLoyut.dart';
import 'package:my_app/components/Layout/MainLayout.dart';
import 'package:my_app/models/news_model.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, this.newsDataDetail});
  final NewsModel? newsDataDetail;
  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  void initState() {
    // print('--->name ${widget.newsDataDetail?.name}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Haber Detay',
      body: Detailloyut(
        detailDescription: widget.newsDataDetail?.description ?? '',
        detailName: widget.newsDataDetail?.name ?? '',
        detailImage: widget.newsDataDetail?.image ?? '',
      ),
      currentIndex: 0,
    );
  }
}
