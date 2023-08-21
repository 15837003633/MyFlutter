
import 'package:flutter/material.dart';
import 'package:hello_flutter/Douban/subject/subject.dart';

import '../home/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "豆瓣",
        theme: ThemeData(
            primaryColor: Colors.green
        ),
        home: Scaffold(
          body: IndexedStack(
            index: 0,
            children: [
              HomePages(),
              SubjectPages(),
              HomePages(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.green,
            items: [
              BottomNavigationBarItem(icon: Image.asset("resource/tabbar/home.png",width: 30,),activeIcon: Image.asset("resource/tabbar/home_active.png",width: 30,), label: "home"),
              BottomNavigationBarItem(icon: Image.asset("resource/tabbar/home.png",width: 30,),activeIcon: Image.asset("resource/tabbar/home_active.png",width: 30,), label: "home"),

            ],
          ),
        )

    );
  }
}

class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("hello world");
  }
}