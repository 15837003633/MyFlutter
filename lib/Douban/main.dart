import 'package:flutter/material.dart';
import 'pages/main/main_pages.dart';
main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green,
          // highlightColor: Colors.transparent,
          splashColor: Colors.transparent
      ),
      home: WDMainPages(),
    );
  }
}
