
import 'package:flutter/material.dart';
main()=>runApp(MYApp());
class MYApp extends StatelessWidget {
  const MYApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hi"),
        ),
        body: WDHomeContent(),
      ),
    );
  }
}

class WDHomeContent extends StatefulWidget {
  const WDHomeContent({Key? key}) : super(key: key);

  @override
  State<WDHomeContent> createState() => _WDHomeContentState();
}

class _WDHomeContentState extends State<WDHomeContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      width: 200,
      height: 200,
      // alignment: Alignment(0, 0),
      child: Text("hello",
        style: TextStyle(color: Colors.red,backgroundColor: Colors.lightBlue),
      ),
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Text("hello",
      style: TextStyle(color: Colors.red,backgroundColor: Colors.lightBlue),
      ),
    );
  }
}


