
import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  double rateNum;
  double rateMax;
  int starCount;
  Color unSelectedColor;
  Color selectedColor;
  double size;


  StarRatingWidget({
    required this.rateNum,
    this.rateMax = 10,
    this.starCount = 5,
    this.unSelectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffe0aa46),
    this.size = 30
  });

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        unSelectRows(),
        selectRows()
      ],
    );
  }

  Widget unSelectRows(){
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(widget.starCount, (index)  {
        return Icon(Icons.star_border, color: widget.unSelectedColor, size: widget.size);
      })
    );
  }

  Widget selectRows(){
    double oneStarNum = widget.rateMax / widget.starCount;
    int fulStarNum = (widget.rateNum / oneStarNum).floor();
    double unFulStarNum = widget.rateNum / oneStarNum - fulStarNum;
    List<Widget> starList = List.generate(fulStarNum, (index)  {
      return Icon(Icons.star, color: widget.selectedColor, size: widget.size);
    });
    Widget clipWidget = ClipRect(
      clipper: MyRectClipper(unFulStarNum * widget.size),
      child: Icon(Icons.star, color: widget.selectedColor, size: widget.size),
    );
    starList.add(clipWidget);
    return Row(
        mainAxisSize: MainAxisSize.min,
        children: starList
    );
  }
}


class MyRectClipper extends CustomClipper<Rect>{
  double width;
  MyRectClipper(this.width);

  @override
  Rect getClip(Size size){
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(MyRectClipper oldClipper) {
    return oldClipper.width != width;
  }

}

