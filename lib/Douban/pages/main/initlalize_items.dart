import 'package:flutter/material.dart';
import 'package:hello_flutter/Douban/pages/group/group.dart';
import 'package:hello_flutter/Douban/pages/mall/mall.dart';
import 'package:hello_flutter/Douban/pages/profile/profile.dart';

import 'bottom_tabbar_item.dart';
import '../subject/subject.dart';
import '../home/home.dart';
List<WDBottomTabBarItem> items = [
  WDBottomTabBarItem("home","主页"),
  WDBottomTabBarItem("subject","书影音"),
  WDBottomTabBarItem("group","小组"),
  WDBottomTabBarItem("mall","集市"),
  WDBottomTabBarItem("profile","我的"),
];

List<Widget> pages = [
  WDHomePage(),
  WDSubjectPage(),
  WDGroupPage(),
  WDMallPage(),
  WDProfilePage(),
];