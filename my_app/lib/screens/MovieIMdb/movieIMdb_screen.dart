import 'package:flutter/material.dart';
import 'package:my_app/components/Layout/ListLayout.dart';
import 'package:my_app/components/Layout/MainLayout.dart';
import 'package:my_app/models/movieImdb_model.dart';
import 'package:my_app/services/api/movieimdb_serviceApi.dart';

class MovieimdbScreen extends StatefulWidget {
  const MovieimdbScreen({super.key});

  @override
  State<MovieimdbScreen> createState() => _MovieimdbScreenState();
}

class _MovieimdbScreenState extends State<MovieimdbScreen> {
  List<MovieImdbModel> movieImdbData = [];
  @override
  void initState() {
    MovieimdbServiceApi()
        .getMovieImdb()
        .then(
          (value) => setState(() {
            movieImdbData.clear();
            movieImdbData.addAll(value);
            // print('--->movieImdbData $movieImdbData');
          }),
        )
        .catchError((erorr) => print(erorr));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      title: 'Filmler',
      body: Listlayout(
        itemCount: movieImdbData.length,
        title: movieImdbData.map((e) => e.title).toList(),
        subtitle: movieImdbData.map((e) => e.year).toList(),
        info: movieImdbData.map((e) => e.imdbID).toList(),
        data: movieImdbData,
        rightText: true,
        imageUrls: movieImdbData.map((e) => e.poster).toList(),
      ),
      currentIndex: 2,
    );
  }
}
