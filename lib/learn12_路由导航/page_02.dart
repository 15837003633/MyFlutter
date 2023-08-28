import 'package:flutter/material.dart';

class Page02 extends StatefulWidget {
  final String nickname;
  const Page02(this.nickname, {Key? key}) : super(key: key);
  static const String routeName = "/page02";

  @override
  State<Page02> createState() => _Page02State();
}

class _Page02State extends State<Page02> {
  String? msg = "default";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    msg = widget.nickname;
    return Scaffold(
      appBar: AppBar(
        title: Text("page02"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("$msg asasdasdasdasdasd" ?? ""),
            TextButton(
              child: Text("返回"),
              onPressed: () {
                Navigator.of(context).pop<String>("abc");
              },
            ),
          ],
        ),
      ),
    );
  }
}
