import 'package:flutter/material.dart';

main() => runApp(MyAppWidget());

class MyAppWidget extends StatefulWidget {
  @override
  State<MyAppWidget> createState() => _MyAppWidgetState();
}

class _MyAppWidgetState extends State<MyAppWidget> {
  int countNum = -1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("hello"),
        ),
        body: WDDataWidget(counter: countNum, child: MyHomeWidget()),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            {
              print("press");
              setState(() {
                countNum++;
              });
            }
          },
        ),
      ),
    );
  }
}

class MyHomeWidget extends StatefulWidget {
  @override
  State<MyHomeWidget> createState() => _MyHomeWidgetState();
}

class _MyHomeWidgetState extends State<MyHomeWidget> {
  late int countNum;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WDDataWidget dataWidget = WDDataWidget.of(context);
    final countNum = dataWidget.counter;
    return Text("hello world $countNum");
  }
}

class WDDataWidget extends InheritedWidget {
  //需要共享的数据
  final int counter;
  const WDDataWidget({
    Key? key,
    required this.counter,
    required Widget child,
  }) : super(key: key, child: child);
//固定写法
  static WDDataWidget of(BuildContext context) {
    final WDDataWidget? result =
        context.dependOnInheritedWidgetOfExactType<WDDataWidget>();
    assert(result != null, 'No WDDataWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(WDDataWidget old) {
    return old.counter != counter;
  }
}
/*
InheritedWidget是Flutter中的一种特殊的Widget，它提供了一个在Widget树中分发数据的简单方法。以下是InheritedWidget的优缺点：

优点：
1. 数据共享：InheritedWidget最大的优势就是能够在Widget树中提供数据共享，子widget可以通过它获取到父级或者祖先级别部件中的数据，避免了显式参数传递。
2. 高效：只有当依赖改变时才会重新构建。当InheritedWidget发生改变时，所有依赖（调用了context.dependOnInheritedWidgetOfExactType()方法）的子widget都会更新，但不会重新构建整棵树。
3. 灵活：可以和其他组件结合使用以实现更复杂的功能。

缺点：
1. 使用复杂：相较于直接传递参数或者使用其他状态管理工具如Provider、Riverpod等，InheritedWidget对新手来说可能比较难以理解和使用。
2. 限制性：默认情况下只能在build方法内部获取到数据，如果需要在其他地方（如生命周期方法）获取到数据，则需要额外进行处理。同时也无法做到局部更新，在某个数据改变时必须重新构建所有依赖此widget的子节点。
3. 不易管理：当项目规模增大后，如果全部或者主要依赖InheritedWidget进行状态管理，则可能出现维护困难、代码混乱等问题。

总结来说，在小型项目和对性能要求不高的场景下，使用InheritedWidget是个不错的选择。然而，在大型项目和对性能有所要求的情况下则可能需要配合其他状态管理工具或者方案一起使用。
 */
