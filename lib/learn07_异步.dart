import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'dart:async';

main(List<String> args){
  runApp(Text("hiasdasdsa \n as\ndas\ndasd",textDirection:TextDirection.ltr));
  getAllLivingRoom().then((value){
    for (var room in value){
      var name = room.name;
      print("value is $name");
    }
  });
}

class LivingRoom {
   String name;
   int hot;
   String pic;
  LivingRoom(Map<String,dynamic> map) : this.name = map["name"],this.hot = map["hot"],this.pic = map["pic"];
}

Future<List<LivingRoom>> getAllLivingRoom() async{
  var jsonString = await rootBundle.loadString("resource/yz.json");
  final jsonRet = json.decode(jsonString);
  List<LivingRoom> rooms = [];
  for (Map<String,dynamic> map in jsonRet){
    var roomObj = LivingRoom(map);
    rooms.add(roomObj);
  }
 return rooms;
}