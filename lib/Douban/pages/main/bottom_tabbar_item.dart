
import 'package:flutter/material.dart';

class WDBottomTabBarItem extends BottomNavigationBarItem{
  final String imageName;
  final String title;
  WDBottomTabBarItem(this.imageName,this.title):super(icon: Image.asset("resource/tabbar/$imageName.png",width: 30,),activeIcon: Image.asset("resource/tabbar/${imageName}_active.png",width: 30,),label: title);
}
