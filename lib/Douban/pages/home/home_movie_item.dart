import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:hello_flutter/Douban/models/movie_item.dart';
import 'package:hello_flutter/Douban/widgets/star_rating.dart';
import 'package:hello_flutter/Douban/widgets/xu_line.dart';

class WDHomeMovieItem extends StatelessWidget {
  final MovieItem item;

  const WDHomeMovieItem(this.item, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 8, color: Color(0xffcccccc)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildTop(),
          SizedBox(
            height: 6,
          ),
          buildContent(),
          SizedBox(
            height: 8,
          ),
          buildRawTitle()
        ],
      ),
    );
  }

  //1 顶部
  Widget buildTop() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(5)),
      child: Text("No.${item.rank}"),
    );
  }

  // 2 内容
  Widget buildContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildContentImage(),
        SizedBox(
          width: 8,
        ),
        buildContentInfo(),
        buildContentLine(),
        buildContentLike()
      ],
    );
  }

  //2.1
  Widget buildContentImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          item.imageURL,
          height: 150,
        ));
  }

  //2.2
  Widget buildContentInfo() {
    return Expanded(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildContentInfoTitle(),
            buildContentInfoRate(),
            buildContentInfoDesc(),
          ],
        ),
      ),
    );
  }

  //2.2.1
  Widget buildContentInfoTitle() {
    return Text.rich(
      TextSpan(
        children: [
          WidgetSpan(
              child: Icon(
            Icons.play_circle_outline,
            color: Colors.pink,
          )),
          TextSpan(
              text: item.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextSpan(
            text: "(${item.playDate})",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }

  //2.2.2
Widget buildContentInfoRate(){
    return Row(
      children: [
        StarRatingWidget(rateNum: item.rating??0,size: 30,),
        Text("${item.rating ?? 0}",style: TextStyle(fontSize: 18),)
      ],
    );
}
//2.2.3
Widget buildContentInfoDesc(){
    final gen = item.genres?.join(" ");
    final dir = item.director?.name ?? "";
    final casts = item.casts?.map((e) => e.name).toList().join("/");
    final content = "$gen $dir $casts";
    return Text(content,maxLines: 2,overflow: TextOverflow.ellipsis,);
}

//2.3
Widget buildContentLine(){
    return Container(height: 100,child: XuLine(axis: Axis.vertical,count: 10,xuWidth: 1,xuHeight: 5,color: Colors.grey,));
}
//2.4
Widget buildContentLike(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Icon(Icons.heart_broken,color: Colors.yellow,size: 30,),
          Text("想看",style: TextStyle(fontSize: 17,color: Colors.yellow),)
        ],
      ),
    );
}
//3
Widget buildRawTitle(){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0xffdddddd),
        borderRadius: BorderRadius.circular(5)
      ),
      child: Text(item.originalTitle ?? "",style: TextStyle(color: Colors.grey),),
    );
}
}
