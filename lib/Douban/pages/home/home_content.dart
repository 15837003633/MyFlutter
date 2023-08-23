import 'package:flutter/material.dart';

import '../../models/movie_item.dart';
import '../../service/home_request.dart';
import 'home_movie_item.dart';

class WDHomeContent extends StatefulWidget {
  @override
  State<WDHomeContent> createState() => _WDHomeContentState();
}

class _WDHomeContentState extends State<WDHomeContent> {
  List<MovieItem> moviveItems = [];

  @override
  void initState() {
    // TODO: implement initState
    HomeRequest.requestMoviesList().then((value) {
      print("requestMoviesList $value");
      setState(() {
        moviveItems.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: moviveItems.length,
        itemBuilder: (ctx, index) {
          return WDHomeMovieItem(moviveItems[index]);
        });
  }
}
