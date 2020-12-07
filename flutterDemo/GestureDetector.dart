/*
该GestureDetector widget并不具有显示效果，而是检测由用户做出的手势。 当用户点击Container时，
 GestureDetector会调用它的onTap回调， 在回调中，将消息打印到控制台。
 您可以使用GestureDetector来检测各种输入手势，包括点击、拖动和缩放。

许多widget都会使用一个GestureDetector为其他widget提供可选的回调。
 例如，IconButton、 RaisedButton、 和FloatingActionButton ，它们都有一个onPressed回调，
 它会在用户点击该widget时被触发。
*/
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "手势",
      home: Scaffold(
        appBar: new AppBar(title: new Text('手')),
        body: MyButton(),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      // on 什么全是回调函数
      onTap: () {
        print('按钮被监听');
      },
      onPanDown: (DragDownDetails details) {
        print("点击位置： ${details.toString()}");
      },
      child: new Container(
        // 手势触发的组件
        height: 36.0,
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(5.0),
          color: Colors.lightGreen[500],
        ),
        child: new Center(
          child: new Text('做手势'),
        ),
      ),
    );
  }
}
