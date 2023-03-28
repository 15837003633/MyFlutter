import 'package:flutter/material.dart';

main(){
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
              appBar: AppBar(
                title: Text("a title"),
              ),
              body: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(value: true, onChanged: (value)=> print("value is $value")),
                    Text("同意")
                  ],
                ),
              )
          )
      )
  );
}

