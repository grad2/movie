import 'package:rxdart/rxdart.dart';
import 'package:untitled/data/movie_source.dart';
import 'package:untitled/domain/entity/details_movie.dart';

class MovieBlock {

  final _movieStream = BehaviorSubject<DetailsMovie>();
  final int id;
  MovieBlock(this.id) {
    setDetailsMovie();
  }

  BehaviorSubject<DetailsMovie> get movieStream => _movieStream;


  void setDetailsMovie() async {
    Map<String, dynamic>? _getDetailsMovie =  await MovieSource().getDetailsMovie(id);
    _movieStream.add(DetailsMovie.fromJson(_getDetailsMovie!));
    }

  void dispose() {
    _movieStream.close();
  }
}