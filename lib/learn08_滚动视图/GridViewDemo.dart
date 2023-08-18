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
        body: MYGridViewDemo01(),
      ),
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
        children: List.generate(100, (index){
          return Container(
            color: Colors.blue,
          );
        }),
      ),
    );
  }
}

class MYGridViewDemo01 extends StatefulWidget {
  const MYGridViewDemo01({Key? key}) : super(key: key);

  @override
  State<MYGridViewDemo01> createState() => _MYGridViewDemo01State();
}

class _MYGridViewDemo01State extends State<MYGridViewDemo01> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent:100, mainAxisSpacing: 10,crossAxisSpacing: 10), itemBuilder: (ctx, index){
      return Container(
        color: Colors.blue,
        child: Text("hi"),
      );
    });
  }

}
