abstract class MovieDataSource {

  Future<Map<String, dynamic>?> getMovieUrl(int page);
  Future<Map<String, dynamic>?> getDetailsMovie(int movieId);
}
