import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:untitled/domain/entity/details_movie.dart';
import 'package:untitled/presentation/block/movie_block.dart';
import 'package:untitled/presentation/widget/average_stars_widget.dart';

class MovieScreen extends StatelessWidget {
  final int id;

  const MovieScreen({Key? key, required this.id }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<MovieBlock>(
        create: (_) => MovieBlock(id),
        dispose: (_, movieBlock) => movieBlock.dispose(),
        child: Consumer<MovieBlock>(
            builder: (_, movieBlock, child) {
              return StreamBuilder<DetailsMovie>(
                  stream: movieBlock.movieStream,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const SizedBox.shrink();
                    }
                    return Scaffold(
                        appBar: AppBar(
                          title: Text(snapshot.data!.originalTitle!),
                        ),

                        body: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              Image.network(
                                  snapshot.data!.backdropPath,
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
                                              snapshot.data!.originalTitle!,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 25.0,
                                              ),
                                            ),
                                          ),
                                          AverageStarsItem(
                                              average: snapshot.data!.voteAverage!),
                                        ],
                                      ),
                                      Flex(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        direction: Axis.vertical,
                                        children: [
                                          Text(
                                            snapshot.data!.releaseDate!,
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
                                            snapshot.data!.overview!,
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
                                            snapshot.data!.genres,
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
                                          Text('${snapshot.data!.runtime!} min',
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
              );
            }
        )
    );
  }
}

