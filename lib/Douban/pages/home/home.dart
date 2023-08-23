import 'package:flutter/material.dart';

import '../../models/movie_item.dart';
import '../../service/home_request.dart';
import 'home_content.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
      ),
      body: WDHomeContent(),
    );
  }
}

