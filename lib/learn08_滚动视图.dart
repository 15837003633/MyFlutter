import 'package:flutter/material.dart';
import 'learn07_异步.dart';

main()=>runApp(Myapp());

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Layout"),
        ),
        body: MyHomeBody03(),
      ),
    );
  }
}


//ListView基础，静态的ListView
class MyHomeBody extends StatelessWidget {
  final TextStyle textStyle = TextStyle(fontSize: 20, color: Colors.redAccent);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("人的一切痛苦，本质上都是对自己无能的愤怒。", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("人活在世界上，不可以有偏差；而且多少要费点劲儿，才能把自己保持到理性的轨道上。", style: textStyle),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("我活在世上，无非想要明白些道理，遇见些有趣的事。", style: textStyle),
        ),
        ListTile(
          leading: Icon(Icons.people, size: 36,),
          title: Text("联系人"),
          subtitle: Text("联系人信息"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}


//ListView的build命名构造函数
class MyHomeBody01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 100,
        itemExtent: 60,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("标题$index"), subtitle: Text("详情内容$index"));
        }
    );
  }
}


//ListView动态数据
class MyHomeBody03 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyHomeBodyState();
  }
}

class MyHomeBodyState extends State<MyHomeBody03> {
  List<LivingRoom> anchors = [];

  // 在初始化状态的方法中加载数据
  @override
  void initState() {
    getAllLivingRoom().then((anchors) {
      setState(() {
        print("isisisisiis $anchors");
        this.anchors = anchors;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: anchors.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                anchors[index].pic,
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 8),
              Text(anchors[index].name, style: TextStyle(fontSize: 20),),
              SizedBox(height: 5),
              Text(anchors[index].hot.toString())
            ],
          ),
        );
      },
    );
  }
}

