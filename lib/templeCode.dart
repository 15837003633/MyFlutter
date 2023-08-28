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
        body: MyHomeWidget(),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("hello world");
  }
}

class WUCountWidget extends InheritedWidget {
  const WUCountWidget({
    Key? key,
    required Widget child,
  }) : super(key: key, child: child);

  static WUCountWidget of(BuildContext context) {
    final WUCountWidget? result = context.dependOnInheritedWidgetOfExactType<WUCountWidget>();
    assert(result != null, 'No WUCountWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(WUCountWidget old) {
    return ;
  }
}


