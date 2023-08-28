import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/*三部曲
1.ChangeNotifier  用来包装状态
2.ChangeNotifierProvider   加入到widgetTree
3.Consumer  消费状态，也就是使用状态
 */


//step 1
class WDDataProvider with ChangeNotifier{
  int _counterNum = -1;

  int get counterNum => _counterNum;

  set counterNum(int value) {
    _counterNum = value;
    notifyListeners();
  }
}

main() => runApp(MyAppWidget());

class MyAppWidget extends StatefulWidget{
  @override
  State<MyAppWidget> createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx){
         return WDDataProvider();
      },
      child: MaterialApp(
        home: Scaffold(
          appBar:AppBar(
            title: Text("hello"),
          ),
          body: MyHomeWidget02(),
          floatingActionButton: WDAddButton02(),
        ),
      ),
    );
  }
}


// selector
class WDAddButton02 extends StatelessWidget {
  const WDAddButton02({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Selector<WDDataProvider,WDDataProvider>(
      selector:(ctx, provider) => provider,// 对原provider进行转换
      shouldRebuild: (pre,next) => false,//决定状态改变时，要不要rebuild
      builder: (context, value, child){
        //使用Selector代替Consumer ，状态改变时，这个不会调用，减少rebuild提升性能
        print("FloatingActionButton 展示的Consumer builder");
        return FloatingActionButton(
          child: child,
          onPressed: ()=>value.counterNum ++,
        );
      },
      child: Icon(Icons.add),
    );
  }
}


class MyHomeWidget02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyHomeWidget02 build");
    //  Provider.of 也可以取值，不常用，为什么呢？
    //  因为Consumer在刷新整个Widget树时，会尽可能少的rebuild Widget。
    int counter =  Provider.of<WDDataProvider>(context).counterNum;
    return Text("hello world ${counter}");
  }
}


/*
class WDAddButton extends StatelessWidget {
  const WDAddButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WDDataProvider>(
      builder: (context, value, child){
        print("Consumer builder01");
        return FloatingActionButton(
          child: child,
          onPressed: (){
            value.counterNum ++;
          },
        );
      },
      child: Icon(Icons.add),
    );
  }
}
class MyHomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("MyHomeWidget build");
    return Consumer<WDDataProvider>(
        builder: (ctx, value, child){
          print("Text 的 Consumer builder $child");
          return Text("hello world ${value.counterNum}");
        }
    );
  }
}
 */