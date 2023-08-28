import 'package:flutter/material.dart';
import 'page_02.dart';

import 'home_page.dart';
import 'page_1.dart';
class MyRouter {
  static final routes = {
    AppHomeWidget.routeName : (ctx)=>AppHomeWidget(),
    Page01.routeName : (ctx)=>Page01()
  };

  static const initializeRoute =  AppHomeWidget.routeName;

  static RouteFactory generateRoute = (setting) {
    if (setting.name == Page02.routeName)
    return MaterialPageRoute(builder: (cxt){
      return Page02(setting.arguments as String);
    });
  };

}