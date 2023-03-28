import 'package:flutter/material.dart';

main()=>runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text("a title"),
            ),
            body: HomeContent()
        )
    );
  }
}

class HomeContent extends StatelessWidget{

  const HomeContent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AgreeMent()
    );
  }
}
class AgreeMent extends StatefulWidget {
  const AgreeMent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return  AgreeMentState();
  }
}

class AgreeMentState extends State<AgreeMent>{
  var flag = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(value: flag, onChanged: (value){
          setState(() {
            flag = value!;
          });
        }),
        const Text("同意?")
      ],
    );
  }

}


