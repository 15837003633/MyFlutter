import 'package:flutter/material.dart';

class Page01 extends StatefulWidget {
  const Page01({Key? key}) : super(key: key);
  static const String routeName = "/page01";

  @override
  State<Page01> createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  String? msg = "default";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    msg = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: Text("page01"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(msg ?? ""),
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
