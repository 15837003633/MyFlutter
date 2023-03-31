
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
    return Column(
      children: [
        MyHomeBody03(),
        MyHomeBody04(),
        MyHomeBody05(),
      ],
    );
  }
}


class MyHomeBody00 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(" text text");
  }
}
class MyHomeBody01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: "《定风波》", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black)),
          TextSpan(text: "苏轼", style: TextStyle(fontSize: 18, color: Colors.redAccent)),
          TextSpan(text: "\n莫听穿林打叶声，何妨吟啸且徐行。\n竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。")
        ],
      ),
      style: TextStyle(fontSize: 20, color: Colors.purple),
      textAlign: TextAlign.center,
    );
  }
}

class MyHomeBody03 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Image.asset("resource/image/kkicon.png");
    return Image(
      image: AssetImage("resource/image/kkicon.png",),
      width: 100,
      height: 200,
      fit: BoxFit.fill,
    );
  }
}

class MyHomeBody04 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
        "resource/image/app_icon@2x.png",
      // width: 300,
    );

  }
}

class MyHomeBody05 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network("https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg");
  }
}