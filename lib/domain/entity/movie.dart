class Movie {

  bool? adult;
  String backdropPath;
  List<int>? genreIds;
  int id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;


  Movie.fromJson(Map<String, dynamic> json)
      :
        adult = json['adult'],
        backdropPath = _getImage(json),
        genreIds = json['genre_ids'].cast<int>(),
        id = json['id'],
        originalLanguage = json['original_language'],
        originalTitle = json['original_title'],
        overview = json['overview'],
        popularity = json['popularity'],
        posterPath = json['poster_path'],
        releaseDate = json['release_date'],
        title = json['title'],
        video = json['video'],
        voteAverage = json['vote_average']?.toDouble(),
        voteCount = json['vote_count'];

  static List<Movie> listMovie(Map<String, dynamic> json) {
    List<Movie> movie = <Movie>[];
    json['results'].forEach((v) {
      movie.add(Movie.fromJson(v));
    });
    return movie;
  }
  static _getImage(Map<String, dynamic> json) {
    if (json['backdrop_path'].toString() == 'null') {
      return 'https://serial-go.org/uploads/no_poster.jpg';
    } else {
      return 'https://www.themoviedb.org/t/p/w220_and_h330_face' +
          json['backdrop_path'].toString();
    }
  }
}