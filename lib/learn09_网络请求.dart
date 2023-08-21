import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("hello"),
        ),
        body: MyHomeWidget(),
      ),
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  String? contentStr;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    /* Dio 请求
     Dio().request<String>("https://www.kktv5.com/",queryParameters: {"name":"wuDang"}).then((value) {
      print(value);
      setState(() {
        contentStr = value.data;
      });
    });
     */

    /*
    自己再Dio基础上封装一层
     */
    ApiService.requets<String>("https://www.kktv5.com/").then((value){
      print(value);
      setState(() {
        contentStr = value;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    return Container(child: Text(contentStr ?? "hellow"),color:Colors.red);
  }
}




class ApiService {
  static final dio = Dio();
  static Future<T?> requets<T>(String url, {Map<String, dynamic>? params}) async{
    try {
      Response<T> rep =  await dio.request<T>(url, queryParameters: params);
      return rep.data;
    } on DioError catch(error) {
      return Future.error(error);
    }

  }
}