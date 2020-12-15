/*
状态管理
组件中参数的状态和组件状态

Widget管理自己的状态。
Widget管理子Widget状态。
混合管理（父Widget和子Widget都管理状态）。

如何决定使用哪种管理方法？下面是官方给出的一些原则可以帮助你做决定：

- 如果状态是用户数据，如复选框的选中状态、滑块的位置，则该状态最好由父Widget管理。
- 如果状态是有关界面外观效果的，例如颜色、动画，那么状态最好由Widget本身来管理。
- 如果某一个状态是不同Widget共享的则最好由它们共同的父Widget管理。

URL： https://book.flutterchina.club/chapter3/state_manage.html

例子将使用GestureDetector来识别点击事件，【手势触发器】
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyController());
}

class MyController extends StatelessWidget {
  const MyController({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "状态管理",
      home: IndexPage(),
    );
  }
}

// 主页
class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("状态控制的主页"),
      ),
      body: ButtonBar(
        children: [
          FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (xontext) {
                      return Scaffold(
                        appBar: AppBar(
                          title: Text("box 1"),
                        ),
                        body: TapboxA(),
                      );
                    },
                  ),
                );
              },
              color: Color.fromARGB(189, 150, 200, 199),
              child: Text("box 1")),
        ],
      ),
    );
  }
}

// 第一个盒子
class TapboxA extends StatefulWidget {
  TapboxA({Key key}) : super(key: key);

  @override
  _TapboxAState createState() => _TapboxAState();
}

class _TapboxAState extends State<TapboxA> {
  bool _active = false;

  _opTopStatus() {
    setState(() {
      print("状态 _opTopStatus $_active");
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _opTopStatus(), // 点击事件的回调
      child: Container(
        child: new Center(
          child: new Text(
            _active ? '点击' : '未点击',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          // 装时器
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}
