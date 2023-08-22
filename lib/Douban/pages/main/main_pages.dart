
import 'package:flutter/material.dart';

import 'initlalize_items.dart';

class WDMainPages extends StatefulWidget {
  const WDMainPages({Key? key}) : super(key: key);

  @override
  State<WDMainPages> createState() => _WDMainPagesState();
}

class _WDMainPagesState extends State<WDMainPages> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
