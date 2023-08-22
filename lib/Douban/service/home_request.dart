import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hello_flutter/Douban/service/http_request.dart';

import '../models/movie_item.dart';

class HomeRequest {
  static Future<List<MovieItem>> requestMoviesList() async{
    //这里接口过期了，所以用try catch模拟数据。正常情况是没必要再写try catch了
    try {
      var ret = await HttpRequest.requets("/v2/movie/top250");
      return ret;
    }catch (error){
      print("这里接口过期了，所以用try catch模拟数据 $error");
      String jsonString = await rootBundle.loadString("resource/douban_movies.json");
      Map jsonMap = json.decode(jsonString);
      List<dynamic> movies = jsonMap["subjects"];
      List<MovieItem> movieItems = [];
      for (Map<String,dynamic> map in movies){
        movieItems.add(MovieItem.fromMap(map));
      }
      return movieItems;
      // return Future.error(error);
    }

  }
}