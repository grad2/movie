import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:untitled/data/movie_source.dart';
import 'package:untitled/domain/entity/movie.dart';
import 'package:untitled/presentation/block/main_block.dart';
import 'package:untitled/presentation/widget/movie_item.dart';


class MainScreen extends StatelessWidget  {


  @override
  Widget build(BuildContext context) {
    return Provider<MainBlock>(
      create: (_) => MainBlock(),
        dispose: (_, mainBlock) => mainBlock.dispose(),
        child : Consumer<MainBlock>(
            builder: (_, mainBlock, child) {
              return StreamBuilder<List<Movie>>(
                  stream: mainBlock.movieStream,
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return const SizedBox.shrink();
                    }
                      return Scaffold(
                        body: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          controller: mainBlock.controller,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return MovieItem(
                              movie: snapshot.data![index],);
                          },
                        ),
                      );
                  }
              );
            }
        )
    );
  }
}