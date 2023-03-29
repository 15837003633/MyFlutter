//计数器

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
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: getButtons()
        ),
        Text("count is $count",style: TextStyle(fontSize: 20),),
      ],
    );
  }

  List<Widget> getButtons(){
    return  [
      ElevatedButton(onPressed: (){
        print("++++");
        setState(() {
          count++;
        });
      }, child: Text("+")
      ),
      SizedBox(width: 20),
      ElevatedButton(onPressed: (){
        print("---");
        setState(() {
          count--;
        });
      }, child: Text("-")
      ),
    ];
  }
}



