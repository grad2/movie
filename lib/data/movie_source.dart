import 'package:http/http.dart' as http;
import 'package:untitled/data/movie_data_source.dart';
import 'dart:convert';
class MovieSource extends MovieDataSource{

  @override
  Future<Map<String, dynamic>?> getMovieUrl(int page) async {
    String _url = 'https://api.themoviedb.org/3/movie/popular?api_key=2519876349fe0edb33fdec3770557bad&language=en-US&page=$page';
    try {
      http.Response response = await http.get(Uri.parse(_url));
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } catch (error) {
      print(error);
    }
  }

  @override
  Future<Map<String, dynamic>?> getDetailsMovie(int movieId) async {
    String _url = 'https://api.themoviedb.org/3/movie/$movieId?api_key=2519876349fe0edb33fdec3770557bad&language=en-US';
    try {
      http.Response response = await http.get(Uri.parse(_url));
      Map<String, dynamic> json = jsonDecode(response.body);
      return json;
    } catch (error) {
      print(error);
    }
  }
}
