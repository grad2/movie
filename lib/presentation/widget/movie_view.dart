import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/data/movie_source.dart';
import 'package:untitled/domain/details_movie.dart';
import 'package:untitled/domain/movie.dart';
import 'package:untitled/presentation/widget/stars.dart';

class MovieV extends StatefulWidget {
  MovieV({Key? key, required this.movie}) : super(key: key);
  Movie movie;
  @override
  State<MovieV> createState() => MovieView(movie);
}

class MovieView extends State<MovieV>{
  final Movie movie;
  DetailsMovie? detailsMovie;

  MovieView(this.movie);

  @override
  void initState() {
    setDetailsMovie();
    super.initState();
  }

  void setDetailsMovie() async {
    Map<String, dynamic>? getDetailsMovie =  await MovieSource().getDetailsMovie(movie.id);
    setState(() {
      detailsMovie = DetailsMovie.fromJson(getDetailsMovie!);
    });
  }
  String setGenres(){
    List list = [];
    String main = '';
    String slash = ' / ';
    detailsMovie?.genres?.forEach((element) {
      if (main == ''){
        main = element.name;
      }else{
        main = '$main $slash ${element.name}';
      }
      list.add(element.name);
    });
    return main;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.originalTitle.toString()),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Image.network('https://www.themoviedb.org/t/p/w220_and_h330_face' + movie.backdropPath.toString(),
                //height: double.infinity,
              height: 350.0,
              fit: BoxFit.cover
          ),
          Container(
              padding: const EdgeInsets.all(15.0),
              child: Flex(
                crossAxisAlignment: CrossAxisAlignment.start,
                direction: Axis.vertical,
                children: [
                  Flex(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: Axis.horizontal,
                    children: [
                      Flexible(
                          child: Text(
                            movie.originalTitle.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                            ),
                          ),
                      ),
                      Stars(movie: movie,),
                    ],
                  ),
                  Flex(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: Axis.vertical,
                    children: [
                      Text(
                        '${detailsMovie?.releaseDate}',
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey,

                        ),
                      ),
                    ],
                  ),
                  Flex(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: Axis.vertical,
                    children: [
                      Text(
                        movie.overview.toString(),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 17,
                            color: Colors.blueGrey
                        ),
                      ),
                    ],
                  ),
                  Flex(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: Axis.vertical,
                    children: [
                      const Text(
                        'Genres',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        setGenres(),
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                            color: Colors.blueGrey
                        ),
                      ),
                    ],
                  ),
                  Flex(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    direction: Axis.vertical,
                    children: [
                      const Text(
                        'Run time',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,

                        ),
                      ),
                      Text(
                        '${detailsMovie?.runtime} min',
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 17,
                          color: Colors.blueGrey
                        ),
                      )
                    ],
                  ),
                ],
              )
          )
        ],
      ),
    );
  }
}