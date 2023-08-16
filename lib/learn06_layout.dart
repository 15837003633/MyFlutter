import 'package:flutter/material.dart';

main()=>runApp(Myapp());

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Layout"),
        ),
        body: MyContainerWidget(),
      ),
    );
  }
}

/*
单个子视图布局widget：Align、Center、Padding、Container
多个子视图布局widget：Row Colum Stack
 */

// Align  不设置width/heightFactor会默认无限大，也就是充满父视图
class MyAlignWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Align(
      alignment: Alignment.bottomRight,
      heightFactor: 3,
      child: Icon(Icons.pets),
    );
  }
}

// Center 其实就是Alignment.center的Align:
//class Center extends Align{}
class MyCenterWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      heightFactor: 3,
      child: Icon(Icons.pets),
    );
  }
}

//padding
class MyPaddingWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.all(20),
      child: Icon(Icons.pets,color: Colors.red),
    );
  }
}

//container  //不设置宽高的话，会根据子视图自适应大小，也就是等于子视图大小
class MyContainerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 100,
      height: 100,
      color: Colors.cyan,
      alignment: Alignment.bottomRight,
      child: Icon(Icons.pets,color: Colors.red),
    );
  }
}