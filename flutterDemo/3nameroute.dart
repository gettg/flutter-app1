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
        "new_page": (context) => EchoRoute(),
        "tip2": (context) =>
            TipRoute(text: ModalRoute.of(context).settings.arguments),
      },
      // home: MyHomePage(title: 'Flutter Name Route Home Page'),
      initialRoute: "/", //名为"/"的路由作为应用的home(首页)
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
//MaterialApp有一个onGenerateRoute属性，它在打开命名路由时可能会被调用，之所以说可能，
//是因为当调用Navigator.pushNamed(...)打开命名路由时，如果指定的路由名在路由表中已注册，
//则会调用路由表中的builder函数来生成路由组件；如果路由表中没有注册，
//才会调用onGenerateRoute来生成路由。
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
          if (routeName.length > 2) {
            return MyHomePage(title: '命名路由');
          } else {
            return EchoRoute();
          }
        });
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("${title == null ? "欢迎" : title}"),
        ),
        body: Center(
          child: FlatButton(
            onPressed: () => Navigator.pushNamed(context, "home_page"),
            child: Text("进入主页"),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed("new_page", arguments: "通过名称路由传递的参数信息");
          },
          child: Icon(Icons.ac_unit),
        ));
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
        color: Color.fromARGB(100, 80, 90, 20),
        child: Center(
          child: Row(
            children: [
              FlatButton(
                onPressed: () => Navigator.pushNamed(context, "one_page"),
                child: Text("进入第一个页面"),
              ),
              FlatButton(
                onPressed: () =>
                    Navigator.pushNamed(context, "tip2", arguments: "【参数信息】"),
                child: Text("进入第er个页面"),
              ),
              FlatButton(
                onPressed: () =>
                    Navigator.pushNamed(context, "1", arguments: "页面小于2"),
                child: Text("1"),
              ),
              FlatButton(
                onPressed: () =>
                    Navigator.pushNamed(context, "122", arguments: "页面大于2"),
                child: Text("122"),
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

//  命名路由参数传递
class EchoRoute extends StatelessWidget {
  const EchoRoute({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取路由参数
    var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("命名路由传递值"),
      ),
      body: Center(child: Text(args.toString())),
    );
  }
}

class TipRoute extends StatelessWidget {
  const TipRoute({Key key, @required this.text}) : super(key: key);

  final Object text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("命名参数传递"),
      ),
      body: Center(
        child: Text("${text == null ? "空" : text.toString()}"),
      ),
    );
  }
}
