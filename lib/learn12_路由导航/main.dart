import 'package:flutter/material.dart';
import './route_config.dart';
main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: MyRouter.routes,
      initialRoute: MyRouter.initializeRoute,
        onGenerateRoute: MyRouter.generateRoute,
    );
  }
}
