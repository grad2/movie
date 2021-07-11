import 'package:untitled/domain/details_movie.dart';
import 'package:untitled/domain/movie.dart';


String setGenres(DetailsMovie? detailsMovie) {
  List list = [];
  String main = '';
  String slash = ' / ';
  detailsMovie?.genres?.forEach((element) {
    if (main == '') {
      main = element.name;
    } else {
      main = '$main $slash ${element.name}';
    }
    list.add(element.name);
  });
  return main;
}
String getImage(Movie movie) {
  if (movie.backdropPath.toString() == 'null') {
    return 'https://serial-go.org/uploads/no_poster.jpg';
  } else {
    return 'https://www.themoviedb.org/t/p/w220_and_h330_face' +
        movie.backdropPath.toString();
  }
}

