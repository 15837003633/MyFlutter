import 'package:flutter/material.dart';
import 'pages/main/main_pages.dart';
main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            color: Colors.green
          ),
          // primaryColor: Colors.green,
          // highlightColor: Colors.transparent,
          splashColor: Colors.transparent,//按钮水波纹颜色
      ),
      home: WDMainPages(),
    );
  }
}
