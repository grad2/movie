import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/domain/entity/movie.dart';

import '../screen/movie_screen.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;

  const MovieItem({
    Key? key,
    required this.movie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //listens for on tap
       onTap: () {
         Navigator.push(
           context,
           MaterialPageRoute(
             /// переход на другую страницу
             builder: (context) => MovieScreen(id: movie.id), //goes to the next page & passes value of url and title to it
           ),
         );
       },
      child: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Container(
                height: 200.0, width: 130.0,
                child: Flex(
                    direction: Axis.vertical,
                  children: [
                    Image.network(movie.backdropPath,
                        height: 170.0, fit: BoxFit.fitHeight),
                    Text(
                      movie.releaseDate.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    ),
                    Flex(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      direction: Axis.horizontal,
                      children: <Widget>[
                        Text(
                          movie.popularity.toString() ,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),
                        ),
                        Text(
                          movie.voteAverage.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.0,
                          ),),
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                    height: 190.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          movie.originalTitle.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 3.0),
                        Text(
                          movie.overview.toString(),
                          maxLines: 9,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 13.5,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
          const Divider(height: 6.0, color: Colors.black,),
        ],
      ),
    );
  }
}
