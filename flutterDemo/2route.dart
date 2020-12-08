import 'package:flutter/material.dart';
//

void main() {
  runApp(new Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter APP 1',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("route")),
      body: Center(
        child: Column(
          children: [
            Text("count"),
            Text("$_counter"),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: () {
                //导航到新路由
                //MaterialPageRoute继承自PageRoute类，PageRoute类是一个抽象类，
                //表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建及切换时过渡动画的相关接口及属性。
                //MaterialPageRoute 是Material组件库提供的组件，
                //它可以针对不同平台，实现与平台页面切换动画风格一致的路由切换动画
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      settings: RouteSettings(
                          // 包含路由的配置信息，如路由名称、是否初始路由（首页）
                          name: "新的页面"
                          // arguments: Object,
                          ),
                      builder: (context) {
                        return RouterTestRoute();
                      },
                      // 默认情况下，当入栈一个新路由时，原来的路由仍然会被保存在内存中，
                      //如果想在路由没用的时候释放其所占用的所有资源，可以设置maintainState为false。
                      maintainState: false,
                      // 表示新的路由页面是否是一个全屏的模态对话框，
                      // 在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）
                      fullscreenDialog: false,
                    ));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  NewRoute({
    Key key,
    @required this.text, // 接收一个text参数
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("This is new route"),
            Text(text == null ? "空" : text),
            RaisedButton(
              onPressed: () => Navigator.pop(context, "我是返回值"),
              child: Text("返回"),
            )
          ],
        ),
      ),
    );
  }
}

class RouterTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("第一个跳转"),
        ),
      ),
      body: Row(children: [
        RaisedButton(
          onPressed: () async {
            // 打开`TipRoute`，并等待返回结果
            var result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return NewRoute(
                    // 路由参数
                    text: "我是提示xxxx",
                  );
                },
              ),
            );
            //输出`TipRoute`路由返回结果, 结果怎么赋值给 页面的显示组件
            print("路由返回值: $result");
          },
          child: Text("打开提示页"),
        ),
      ]),
    );
  }
}
