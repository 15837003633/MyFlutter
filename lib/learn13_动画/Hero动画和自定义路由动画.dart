import 'package:flutter/material.dart';

main() => runApp(MyAppWidget());

class MyAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: MyHomeWidget(),
      ),
    );
  }
}

class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 10,
          childAspectRatio: 16.0 / 9.0),
      itemBuilder: (ctx, index) {
        final imageurl = "https://picsum.photos/id/$index/500/400";
        return GestureDetector(
            onTap: () {
              //class PageRouteBuilder<T> extends PageRoute<T>
              //class MaterialPageRoute<T> extends PageRoute<T>
              Navigator.of(context).push(
                  PageRouteBuilder(pageBuilder: (ctx, animation1, animation2) {
                    return FadeTransition(
                        opacity: animation1,
                        child: DetailPage(imageURL: imageurl,));
                  }));
            },
            child: Hero(
                tag: imageurl,
                child: Image.network(imageurl, fit: BoxFit.cover,)));
      },
      itemCount: 20,
    );
  }
}


class DetailPage extends StatelessWidget {
  final String imageURL;

  const DetailPage({required this.imageURL, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Hero(
            tag: imageURL,
            child: Image.network(imageURL,width: double.infinity),
          ),
        ),
      ),
    );
  }
}
