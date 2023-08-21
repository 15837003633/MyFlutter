import 'package:flutter/material.dart';

class SubjectPages extends StatefulWidget {
  const SubjectPages({Key? key}) : super(key: key);

  @override
  State<SubjectPages> createState() => _homePagesState();
}

class _homePagesState extends State<SubjectPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("书影音"),
      ),
      body: Center(child: Text("书影音 内容")),
    );
  }
}
