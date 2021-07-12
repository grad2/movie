import 'dart:math';

import 'package:flutter/material.dart';
import 'package:untitled/data/movie_source.dart';
import 'package:untitled/domain/entity/movie.dart';
import 'package:untitled/presentation/widget/movie_item.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => MyHomeRxPage();
}

class MyHomeRxPage extends State<MyHomePage>  {

  /// Запихивую в блок
  List<Movie> movie = [];
  final ScrollController _controller = ScrollController();
  int page = 1;


  /// Запихивую в блок
  @override
  void initState() {
    super.initState();
    addMovie(page);
    _controller.addListener(_onScroll);
  }

  /// Запихивую в блок
  void _onScroll() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      setState(() {
        page += 1;
        addMovie(page);
      });
    }
  }
  /// Запихивую в блок
  void addMovie(int page) async {
    Map<String, dynamic>? getMovie =  await MovieSource().getMovieUrl(page);
    setState(() {
      movie.addAll(Movie.listMovie(getMovie!));
    });
  }
  /// Оставить
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          controller: _controller,
          itemCount: movie.length,
          itemBuilder: (BuildContext context, int index) {
            return MovieItem(movie: movie[index],);
          },
        ));
  }
}

