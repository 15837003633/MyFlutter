//商品列表

import 'package:flutter/material.dart';

main()=> runApp(WDMyAPP());

class WDMyAPP extends StatelessWidget {
  const WDMyAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.cyan
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("title"),),
        body: WDHomeContent(),
      ),
    );
  }
}

class WDHomeContent extends StatelessWidget {
  const WDHomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductItem("apple","macbook","https://tva1.sinaimg.cn/large/006y8mN6gy1g72j6nk1d4j30u00k0n0j.jpg"),
        ProductItem("sumsung","mobile","https://tva1.sinaimg.cn/large/006y8mN6gy1g72imm9u5zj30u00k0adf.jpg"),
        ProductItem("huawei","china","https://tva1.sinaimg.cn/large/006y8mN6gy1g72imqlouhj30u00k00v0.jpg"),
      ],
    );
  }
}

class ProductItem extends StatelessWidget {
  final title;
  final desc;
  final image;
  ProductItem(this.title,this.desc,this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 1)),
      child: Column(
        children: [
          SizedBox(height: 10,),
          Text(title),
          SizedBox(height: 10,),
          Text(desc),
          SizedBox(height: 10,),
          Image.network(image)
        ],
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }
}



