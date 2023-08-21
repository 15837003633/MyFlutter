
import 'package:flutter/material.dart';

import 'initlalize_items.dart';


class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: "豆瓣",
        theme: ThemeData(
            primaryColor: Colors.green,
          // highlightColor: Colors.transparent,
          splashColor: Colors.transparent
        ),
        home: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children:pages
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Colors.green,
            currentIndex: _currentIndex,
            items:items,
            onTap: (index){
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        )

    );
  }

  BottomNavigationBarItem creatBottomNavigationBarItem(String imageName,String title){
    return BottomNavigationBarItem(icon: Image.asset("resource/tabbar/$imageName.png",width: 30,),activeIcon: Image.asset("resource/tabbar/${imageName}_active.png",width: 30,), label: title);
  }
}

class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("hello world");
  }
}