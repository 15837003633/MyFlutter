import 'dart:ffi';

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

class _MyHomeWidgetState extends State<MyHomeWidget> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final CurvedAnimation _curvedAnima;
  late final _sizeAnima;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(duration: const Duration(seconds: 2),vsync: this);

    _curvedAnima = CurvedAnimation(parent: _controller,curve: Curves.elasticInOut);

    _sizeAnima = Tween(begin: 30.0,end: 50.0).animate(_curvedAnima);


    // _controller.addListener(() {
    //   setState(() {
    //
    //   });
    // });
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed){
        _controller.reverse();
      }else if (status == AnimationStatus.dismissed){
        _controller.forward();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    Animation;
    AnimationController;
    CurvedAnimation;
    Tween;
    AnimatedWidget;


    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconAnimation(anima: _sizeAnima,),
            FloatingActionButton(onPressed: (){
              _controller.forward();
            },child: Icon(Icons.play_circle),)
          ],
        ));
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class IconAnimation extends AnimatedWidget {
  const IconAnimation({Key? key, required Animation anima}) : super(key: key , listenable:anima);

  @override
  Widget build(BuildContext context) {
    Animation animation =  listenable as Animation;

    return  Icon(
        Icons.favorite_outlined,
        color: Colors.red,
        size: animation.value
    );
  }
}

