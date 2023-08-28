import 'package:flutter/material.dart';

main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: MyHomeWidget02(),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Listener(
          child: Container(
            width: 100,
              height: 100,
              alignment: Alignment.center,
              color: Colors.red,
              child: Text("hello world")),
          onPointerDown: (event) {
            print("触摸按下 ${event.position} ${event.localPosition}");
          },
          onPointerMove: (event) {
            print("触摸移动");
          },
          onPointerUp: (event) {
            print("触摸抬起");
          },
        ),
      ],
    ));
  }
}


class MyHomeWidget02 extends StatelessWidget {
  const MyHomeWidget02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: Container(
          width: 100,
          height: 200,
          color: Colors.red,
        ),
        onTap: (){
          print("单击");
        },
        onTapDown: (detail){
          print("单击按下 ${detail.globalPosition} ${detail.localPosition}");
        },
        onDoubleTap: (){
          print("双击");
        },
        onLongPress: (){
          print("长按");
        },
      ),
    );
  }
}
