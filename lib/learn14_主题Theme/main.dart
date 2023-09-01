import 'dart:ui';

import 'package:flutter/material.dart';

main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Colors.yellow, secondary: Colors.green),

        //同时设置primaryColor和accentColor
        primarySwatch: Colors.orange,
        //导航，tabbar颜色 对应colorScheme.primary
        primaryColor: Colors.pink,
        //其他ui默认颜色 已废弃，对应colorScheme.secondary
        accentColor: Colors.green,
        // 点击水波纹颜色
        splashColor: Colors.transparent,
        //点击高亮颜色
        highlightColor: Colors.transparent,

        textTheme: TextTheme(
            bodyText2: TextStyle(color: Colors.red)
        )
      ),
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  const MyHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hello"),
      ),
      body: MyHomeWidget(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("hello world"),
        Text("hello world",style: TextStyle(fontSize: 14.0),),
        Text("hello world",style: TextStyle(fontSize: 14.0.px),),
        Text("hello world",style: TextStyle(fontSize: 28.0.rpx),)
      ],
    );
  }
}

extension ScreenFit on double {
  double get px{
    return this*MyFixScreen.px;
  }
  double get rpx{
    return this*MyFixScreen.rpx;
  }
}
class MyFixScreen{
  static final double screen_width = window.physicalSize.width/window.devicePixelRatio;
  static double px = screen_width/750.0 *2;
  static double rpx = screen_width/750.0;
}

