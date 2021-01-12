import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(ButtonIndex());

class ButtonIndex extends StatelessWidget {
  const ButtonIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "button",
      home: BHome(),
    );
  }
}

class BHome extends StatefulWidget {
  BHome({Key key}) : super(key: key);

  @override
  _BHomeState createState() => _BHomeState();
}

class _BHomeState extends State<BHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "button 的案例",
          style: TextStyle(color: Colors.black26),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RaisedButton(
            child: Text("raised 漂浮 按钮"),
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "它默认带有阴影和灰色背景。按下后，阴影会变大",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
          ),
          FlatButton(
            child: Text("FlatButton 扁平按钮"),
            onPressed: () =>
                Fluttertoast.showToast(msg: "默认背景透明并不带阴影。按下后，会有背景色"),
          ),
        ],
      ),
    );
  }
}
