import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:untitled/data/movie_source.dart';
import 'package:untitled/domain/entity/details_movie.dart';
import 'package:untitled/domain/entity/movie.dart';
import 'package:untitled/presentation/widget/average_stars_item.dart';

class ScreenMovie extends StatefulWidget {
  final Movie movie;

  const ScreenMovie({Key? key, required this.movie}) : super(key: key);

  @override
  State<ScreenMovie> createState() => _ScreenMovie();
}

class _ScreenMovie extends State<ScreenMovie>{
  DetailsMovie? detailsMovie;

  @override
  void initState() {
    setDetailsMovie();
    super.initState();
  }

  void setDetailsMovie() async {
    Map<String, dynamic>? getDetailsMovie =  await MovieSource().getDetailsMovie(widget.movie.id);
    setState(() {
      detailsMovie = DetailsMovie.fromJson(getDetailsMovie!);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.movie.originalTitle.toString()),
        ),

        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Image.network(
                  widget.movie.backdropPath.toString(),
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
                              widget.movie.originalTitle.toString(),
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          AverageStarsItem(average: widget.movie.voteAverage!),
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
                            widget.movie.overview.toString(),
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
                            detailsMovie!.genres.toString(),
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
          ),)

    );
  }
}