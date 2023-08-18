import 'package:flutter/material.dart';
main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar:AppBar(
        //   title: Text("hello"),
        // ),
        body: MyHomeWidget(),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        slivers: [
          SliverAppBar(
            // pinned: true,
            toolbarHeight:100,
            expandedHeight: 300,
            leading: Image.asset("resource/image/kkicon.png"),
          ),
          SliverSafeArea(sliver: MidSliverGrid()),
          BottomSliverList()
        ]);
  }

  SliverList BottomSliverList() {
    return SliverList(delegate: SliverChildBuilderDelegate(
        childCount: 100,
            (ctx, index){
          return Container(child: Text("nihap"),color: Colors.orange,);
        }
    ));
  }

  SliverGrid MidSliverGrid() {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
            childCount: 5,
                (ctx,index){
              return Container(child: Text("nihap"),color: Colors.green);
            }),
        gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
        ) );
  }
}