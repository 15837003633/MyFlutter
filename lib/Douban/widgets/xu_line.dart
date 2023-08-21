import 'package:flutter/material.dart';
// main() => runApp(MyAppWidget());
//
// class MyAppWidget extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar:AppBar(
//           title: Text("hello"),
//         ),
//         body: MyHomeWidget(),
//       ),
//     );
//   }
// }
//
// class MyHomeWidget extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//         Container(child: XuLine(xuWidth: 5,count: 10,),width: 300,),
//         Container(child: XuLine(axis: Axis.vertical,xuHeight: 5,count: 10,),height: 300,),
//
//       ],),
//     );
//   }
// }

class XuLine extends StatelessWidget {
  final Axis axis;
  final double xuWidth;
  final double xuHeight;
  final Color color;
  final int count;

  XuLine({this.axis = Axis.horizontal, this.xuWidth = 1, this.xuHeight = 1, this.color = Colors.red, this.count = 0});

  @override
  Widget build(BuildContext context) {
    return Flex(direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index){
        return   SizedBox(width: xuWidth,height: xuHeight,child: DecoratedBox(decoration: BoxDecoration(color: color),),);
      })
      ,);
  }
}
