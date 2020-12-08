/*
“命名路由”（Named Route）即有名字的路由，我们可以先给路由起一个名字，
然后就可以通过路由名字直接打开新的路由了，这为路由管理带来了一种直观、简单的方式。

要想使用命名路由，我们必须先提供并注册一个路由表（routing table），
这样应用程序才知道哪个名字与哪个路由组件相对应。

Map<String, WidgetBuilder> routes;
*/

import 'package:flutter/material.dart';

void main() {
  runApp(MyNameRouteApp());
}

class MyNameRouteApp extends StatelessWidget {
  const MyNameRouteApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "命名路由",
      routes: {
        "home_page": (context) => HomePage(),
        "one_page": (context) => OnePage(),
        "/": (context) => MyHomePage(title: '命名路由'),
      },
      // home: MyHomePage(title: 'Flutter Name Route Home Page'),
      initialRoute: "/", //名为"/"的路由作为应用的home(首页)
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("${title == null ? "欢迎" : title}"),
            FlatButton(
              onPressed: () => Navigator.pushNamed(context, "home_page"),
              child: Text("进入主页"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home 页面"),
      ),
      body: Container(
        height: 100,
        width: 100,
        color: Color.fromARGB(100, 80, 90, 20),
        child: Center(
          child: Column(
            children: [
              FlatButton(
                onPressed: () => Navigator.pushNamed(context, "one_page"),
                child: Text("进入第一个页面"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OnePage extends StatelessWidget {
  const OnePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("one page"),
      ),
      body: Center(
        child: FlatButton(
          onPressed: () => Navigator.pushNamed(context, "/"),
          child: Text("首页 / 页面"),
        ),
      ),
    );
  }
}

// todo 命名路由参数传递
