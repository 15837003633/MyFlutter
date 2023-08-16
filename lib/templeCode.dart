
/*
临时练习。回顾之前学的flutter基础
 */

import 'package:flutter/material.dart';

main(){
  runApp(MyAppWidget());
}

class MyAppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("hello~~11"),
        ),
        body: HomeWidget(),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("world", style: TextStyle(fontSize: 30)),
          CountButtonWidget(),
        ],
      ),
    );
  }
}

class CountButtonWidget extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CountButtonState();
  }
}
class CountButtonState extends State<CountButtonWidget>{
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    print("initState");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("built");
    return OutlinedButton(onPressed: (){
      print("on click");
      setState(() {
        count++;
      });
    }, child: Text("$count")
    );
  }
}
