
import 'package:flutter/material.dart';

import 'page_02.dart';
import 'page_1.dart';

class AppHomeWidget extends StatelessWidget {
  static const String routeName = "/";
  const AppHomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("hello"),
      ),
      body: MyHomeWidget(),
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  String msg = "default";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(msg),
          TextButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx){
              return Page01();
            })).then((value) {
              setState(() {
                msg = value;
              });
            });
          }, child: Text("push page01")),
          TextButton(onPressed: (){
            Navigator.of(context).pushNamed(Page01.routeName,arguments:  "home msg");
          }, child: Text("pushName page01")),
          TextButton(onPressed: (){
            Navigator.of(context).pushNamed(Page02.routeName,arguments:  "home msg msg");
          }, child: Text("pushName page02"))
        ],
      ),
    );
  }
}