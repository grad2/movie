import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled/data/movie_source.dart';
import 'package:untitled/domain/entity/movie.dart';

class MainBlock {

  final ScrollController _controller = ScrollController();
  int _page = 1;
  final _movieStream = BehaviorSubject<List<Movie>>.seeded([]);

  MainBlock() {
    _addMovie(1);
    _controller.addListener(_onScroll);
  }

  ScrollController get controller => _controller;
  BehaviorSubject<List<Movie>> get movieStream => _movieStream;

  void _addMovie(int page) async {
    Future<Map<String, dynamic>?> _getMovie =  MovieSource().getMovieUrl(page);
    _getMovie.then((value) => {
      _movieStream.add(Movie.listMovie(value!)),
    }
    );
  }

  void _onScroll() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      ++_page;
      _addMovie(_page);
    }
  }

  void dispose() {
    _movieStream.close();
  }
}