import 'package:flutter/material.dart';

class WDSubjectPage extends StatefulWidget {
  const WDSubjectPage({Key? key}) : super(key: key);

  @override
  State<WDSubjectPage> createState() => _subjectPagesState();
}

class _subjectPagesState extends State<WDSubjectPage> {
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
