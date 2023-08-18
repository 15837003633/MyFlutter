import 'package:flutter/material.dart';
main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("hello"),
        ),
        body: MyHomeWidget02(),
      ),
    );
  }
}


//ScrollController的滚动监听
class MyHomeWidget extends StatefulWidget {
  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  final controller = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      print("监听到滚动了 ${controller.offset}");
    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
        itemCount: 20,
        itemExtent: 60,
        itemBuilder: (context, index){
          return Container( //最外层的Container的大小被cell约束着
            alignment: Alignment.center,
            color: Colors.green,
              child: Container(//里面的Container的大小根据子视图的内容填充
                color: Colors.red,
                  child: Container(
                    color: Colors.blue,
                      child: Text("hello ${index}"))
              )
          );
        }
    );
  }
}



//NotificationListener的滚动监听
class MyHomeWidget02 extends StatefulWidget {
  const MyHomeWidget02({Key? key}) : super(key: key);

  @override
  State<MyHomeWidget02> createState() => _MyHomeWidget02State();
}

class _MyHomeWidget02State extends State<MyHomeWidget02> {
  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: (ntf){
        if (ntf is ScrollStartNotification){
          print("开始滚动");
        }else if (ntf is ScrollUpdateNotification){
          print("正在滚动 ${ntf.metrics.pixels}");
        }else if (ntf is ScrollEndNotification){
          print("结束滚动");
        }
        return true;
      },
      child: ListView(
        children: List.generate(100, (index) => Text("data")),
      ),
    );
  }
}
