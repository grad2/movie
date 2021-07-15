import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AverageStarsItem extends StatelessWidget {
  final double average;

  const AverageStarsItem({
    Key? key,
    required this.average
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector( //listens for on tap
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Icon(_getStar(1)),
          Icon(_getStar(2)),
          Icon(_getStar(3)),
          Icon(_getStar(4)),
          Icon(_getStar(5))
        ],
      ),
    );
  }
  IconData _getStar(int position){
    //7.41 // 3.7
    IconData starBorder = Icons.star_border_rounded;
    IconData starHalf = Icons.star_half_rounded;
    IconData starRate = Icons.star_rate_rounded;

    if(average >= position * 2){
      return starRate;
    }else if(average <= position * 2 - 0.5){
      if(position * 2 - 1.5 <= average && position * 2 - 0.5 >= average){
        return starHalf;
      }else{
        return starBorder;
      }
    }else{
      return starRate;
    }

  }

}