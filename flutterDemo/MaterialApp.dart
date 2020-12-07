/*
Material应用程序以MaterialApp widget开始， 该widget在应用程序的根部创建了一些有用的widget，
其中包括一个Navigator， 它管理由字符串标识的Widget栈（即页面路由栈）。
Navigator可以让您的应用程序在页面之间的平滑的过渡。
*/
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.image),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('Material App Have A Navigator'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      //body占屏幕的大部分
      body: new Center(
        child: new Text('Hello, world!'),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}
