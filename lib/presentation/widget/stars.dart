import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/data/movie_source.dart';
import 'package:untitled/domain/details_movie.dart';
import 'package:untitled/domain/movie.dart';

import 'movie_view.dart';

class Stars extends StatelessWidget {
  final double average;

  const Stars({
    Key? key,
    required this.average
  }) : super(key: key);

  IconData? getStar(int position){
    //7.41 // 3.7
    IconData starBorder = Icons.star_border_rounded;
    IconData starHalf = Icons.star_half_rounded;
    IconData starRate = Icons.star_rate_rounded;

    if(average >= position * 2){
      return starRate;
    }else if(average < position * 2 - 0.5){
      if(position * 2 - 1.5 < average && position * 2 - 0.5 > average){
        return starHalf;
      }else{
        return starBorder;
      }
    }else{
      return starRate;
    }

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //listens for on tap
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Icon(getStar(1)),
          Icon(getStar(2)),
          Icon(getStar(3)),
          Icon(getStar(4)),
          Icon(getStar(5))
        ],
      ),
    );
  }
}