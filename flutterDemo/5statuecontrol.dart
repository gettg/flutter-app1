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
      routes: {
        "TapboxA": (context) => TapboxA(),
        "TapboxB": (context) => ParentWidget(),
        "TapboxC": (context) => ParentWidgetC(),
      },
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
              Navigator.pushNamed(context, "TapboxA");
            },
            color: Color.fromARGB(189, 150, 200, 199),
            child: Text("box 1"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "TapboxB");
            },
            color: Color.fromARGB(189, 200, 200, 199),
            child: Text("box 2"),
          ),
          FlatButton(
            onPressed: () {
              Navigator.pushNamed(context, "TapboxC");
            },
            color: Color.fromARGB(189, 200, 200, 240),
            child: Text("box 3"),
          ),
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
  bool _highlight = false;

  void _opTopStatus() {
    setState(() {
      print("状态 _opTopStatus $_active");
      _active = !_active;
    });
  }

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("box 1"),
      ),
      body: Center(
        child: GestureDetector(
          // void Function(); 回调的参数是一个函数
          onTap: _opTopStatus, // 点击事件的回调
          onTapDown: _handleTapDown, // 处理按下事件
          onTapUp: _handleTapUp, // 处理抬起事件
          onTapCancel: _handleTapCancel,
          child: new Container(
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
              border:
                  _highlight ? Border.all(width: 10, color: Colors.red) : null,
            ),
          ),
        ),
      ),
    );
  }
}

// ParentWidget 为 TapboxB 管理状态.

//------------------------ ParentWidget --------------------------------
// 一个动态的 widget 通过参数 控制生成一个 静态的widget页面，来达到控制 静态页面更改的效果
class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: new Center(
        child: new TapboxB(
          active: _active,
          onChanged: _handleTapboxChanged,
        ),
      ),
    );
  }
}

//------------------------- TapboxB ----------------------------------

class TapboxB extends StatelessWidget {
  TapboxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap() {
    onChanged(!active);
  }

  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? '激活' : '失效',
            style: new TextStyle(fontSize: 32.0, color: Colors.blue),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[200] : Colors.grey[1],
        ),
      ),
    );
  }
}

//---------------------------- ParentWidget ----------------------------
// 子类通过父类的函数 回调 控制 父类发生改变，从而是自己发生改变
class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(),
      body: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

//----------------------------- TapboxC ------------------------------

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown, // 处理按下事件
      onTapUp: _handleTapUp, // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        // 盒子--> 中间文字
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        // 盒子的修饰
        decoration: new BoxDecoration(
          // 三目运算符
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}
