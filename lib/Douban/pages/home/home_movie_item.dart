import 'package:flutter/material.dart';
import 'package:hello_flutter/Douban/models/movie_item.dart';
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
          Text("333")
        ],
      ),
    );
  }

  Widget buildTop() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 238, 205, 144),
          borderRadius: BorderRadius.circular(5)),
      child: Text("No.${item.rank}"),
    );
  }

  Widget buildContent() {
    return Row(
      children: [buildImage()],
    );
  }

  Widget buildImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.network(
          item.imageURL ?? "",
          height: 150,
        ));
  }
}
