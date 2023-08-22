import 'package:flutter/material.dart';

import '../../service/home_request.dart';

class WDHomePage extends StatefulWidget {
  const WDHomePage({Key? key}) : super(key: key);
  @override
  State<WDHomePage> createState() => _homePagesState();
}

class _homePagesState extends State<WDHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRequest.requestMoviesList().then((value){
      print("requestMoviesList $value");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: Center(child: Text("我爱你梦梦")),
    );
  }
}
