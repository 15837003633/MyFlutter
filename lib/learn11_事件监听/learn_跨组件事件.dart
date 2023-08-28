import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
final event_bus = EventBus();
main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("hello"),
        ),
        body: MyHomeWidget(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            event_bus.fire("msg");
          },
        ),
      ),
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  late String message = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    event_bus.on<String>().listen((event) {
      setState(() {
        message = event;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Text("hello world $message");
  }
}