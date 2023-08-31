import 'dart:ffi';
import 'dart:math';

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
        body: MyHomeWidget(),
      ),
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _curvedAnima;
  late final Animation _sizeAnima;
  late final Animation _colorAnima;
  late final Animation _rotateAnima;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    _curvedAnima =
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    _sizeAnima = Tween(begin: 30.0, end: 50.0).animate(_curvedAnima);

    _colorAnima = ColorTween(begin: Colors.yellow,end: Colors.pink).animate(_curvedAnima);

    _rotateAnima = Tween(begin: 0.0,end: pi/4.0).animate(_curvedAnima);
    // _controller.addListener(() {
    //   setState(() {
    //
    //   });
    // });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
  }
  @override
  Widget build(BuildContext context) {


    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (ctx, child) {
                return Opacity(
                  //透明度
                  opacity: _controller.value,
                  child: Container(
                    color: _colorAnima.value,
                    width: _sizeAnima.value,
                    height: _sizeAnima.value,
                    //变化，默认围绕左上角变化，如果要中心旋转使用Transform包裹设置对齐
                    transform: Matrix4.rotationZ(_rotateAnima.value),
                    child: child,
                  ),
                );
              },
              //把不需要刷新的widget放在外面，设计理念类似于状态管理的Consumer
              child: Icon(Icons.favorite_outlined, color: Colors.black, size: 30),
            ),
            FloatingActionButton(
              onPressed: () {
                _controller.forward();
              },
              child: Icon(Icons.play_circle),
            )
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
