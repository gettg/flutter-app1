/*
ttatus 的状态转换 https://pcdn.flutterchina.club/imgs/3-2.jpg
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "status",
      home: Scaffold(
        appBar: AppBar(
          title: Text("status"),
        ),
        body: new Mystatus(),
      ),
    );
  }
}

class Mystatus extends StatefulWidget {
  Mystatus({Key key, this.initValue: 0}) : super(key: key);

  final int initValue;

  @override
  _MystatusState createState() => _MystatusState();
}

class _MystatusState extends State<Mystatus> {
  int _counter;

  @override
  void initState() {
    // 当Widget第一次插入到Widget树时会被调用，对于每一个State对象，
    //Flutter framework只会调用一次该回调，所以，通常在该回调中做一些
    //一次性的操作，如状态初始化、订阅子树的事件通知等。
    //不能在该回调中调用BuildContext.dependOnInheritedWidgetOfExactType
    //（该方法用于在Widget树上获取离当前widget最近的一个父级InheritFromWidget，
    //关于InheritedWidget我们将在后面章节介绍），原因是在初始化完成后，
    //Widget树中的InheritFromWidget也可能会发生变化，
    // 所以正确的做法应该在在build（）方法或didChangeDependencies()中调用它。
    super.initState();
    //初始化状态
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    //此回调读者现在应该已经相当熟悉了，它主要是用于构建Widget子树的，会在如下场景被调用：
    //在调用initState()之后。
    //在调用didUpdateWidget()之后。
    //在调用setState()之后。
    //在调用didChangeDependencies()之后。
    //在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
    print("build start ...");
    return Center(
      child: Column(
        children: [
          FlatButton(
            color: Color.fromARGB(122, 23, 23, 99),
            child: Text('计数按钮 $_counter'),
            //点击后计数器自增
            onPressed: () => setState(() => ++_counter),
          ),
          FlatButton(
            child: Text("ios 页面"),
            //点击后计数器自增
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return CupertinoTestRoute();
                },
              ));
            },
          ),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(Mystatus oldWidget) {
    // 当State对象的依赖发生变化时会被调用；
    //例如：在之前build() 中包含了一个InheritedWidget，
    //然后在之后的build() 中InheritedWidget发生了变化，
    //那么此时InheritedWidget的子widget的didChangeDependencies()回调都会被调用。
    //典型的场景是当系统语言Locale或应用主题改变时，
    //Flutter framework会通知widget调用此回调。
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // 当State对象从树中被移除时，会调用此回调。
    //在一些场景下，Flutter framework会将State对象重新插到树中，
    //如包含此State对象的子树在树的一个位置移动到另一个位置时（可以通过GlobalKey来实现）。
    //如果移除后没有重新插入到树中则紧接着会调用dispose()方法
    super.deactivate();
    // Mystatus 组件不活动
    print("deactive");
  }

  @override
  void dispose() {
    // 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
    super.dispose();
    // Mystatus 组件处理掉
    print("dispose");
  }

  @override
  void reassemble() {
    // 此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，
    //此回调在Release模式下永远不会被调用。
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    //在widget重新构建时，Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
    //然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。
    //正如之前所述，Widget.canUpdate会在新旧widget的key和runtimeType同时相等时会返回true，
    //也就是说在在新旧widget的key和runtimeType同时相等时didUpdateWidget()就会被调用。
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

// Cupertino 苹果组件
class CupertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("Cupertino ios 类型"),
      ),
      child: Center(
        child: CupertinoButton(
            color: CupertinoColors.activeBlue,
            child: Text("返回"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
    );
  }
}
