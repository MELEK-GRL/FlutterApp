import 'package:flutter/material.dart';
import 'package:my_app/components/Layout/ListLayout.dart';
import 'package:my_app/components/Layout/MainLayout.dart';
import 'package:my_app/models/news_model.dart';
import 'package:my_app/screens/HomeScreen/newsDetail_screen.dart';
import 'package:my_app/services/api/news_serviceApi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<NewsModel> newsData = [];
  @override
  void initState() {
    NewsServiceApi()
        .getNews()
        .then((value) {
          setState(() {
            newsData.clear();
            newsData.addAll(value);
          });
        })
        .catchError((error) {
          print('Hata: $error');
        });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Ana Sayfa',
      currentIndex: 0,
      body: Listlayout(
        itemCount: newsData.length,
        title: newsData.map((e) => e.name).toList(),
        subtitle: newsData.map((e) => e.description).toList(),
        data: newsData,
        detail: true,
        onTapFunc: (index) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  NewsDetailScreen(newsDataDetail: newsData[index]),
            ),
          );
        },
      ),
    );
  }
}
