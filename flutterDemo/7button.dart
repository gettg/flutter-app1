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
          Text(
            "系统按钮",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 19, color: Colors.blue),
          ),
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
          OutlineButton(
            child: Text("OutlineButton 边框按钮"),
            onPressed: () => Fluttertoast.showToast(
                msg: "不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)"),
          ),
          IconButton(
            icon: Icon(Icons.hail),
            onPressed: () => Fluttertoast.showToast(
                msg:
                    "icon 的 button 携带一个  icon: Icon(Icons.hail) 不包括文字，默认没有背景，点击后会出现背景"),
          ),
          Text(
            "普通的按钮 携带 icon",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 19, color: Colors.blue),
          ),
          Row(
            children: [
              RaisedButton.icon(
                icon: Icon(Icons.send),
                label: Text("发送 RaisedButton"),
                onPressed: _onPressed,
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加 OutlineButton"),
                onPressed: _onPressed,
              ),
              FlatButton.icon(
                icon: Icon(Icons.info),
                label: Text("详情 FlatButton"),
                onPressed: _onPressed,
              ),
            ],
          ),
          Text(
            "自定义按钮",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 19, color: Colors.blue),
          ),
          FlatButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Submit"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: _showDouble,
          ),
          RaisedButton(
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("Submit RaisedButton"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: _showDouble,
          )
        ],
      ),
    );
  }

  void _onPressed() {
    Fluttertoast.showToast(
        msg:
            "RaisedButton、FlatButton、OutlineButton都有一个icon 构造函数，通过它可以轻松创建带图标的按钮");
  }

  void _showDouble() {
    Fluttertoast.showToast(msg: """const RaisedButton/FlatButton({
  @required this.onPressed, //按钮点击回调
  this.textColor, //按钮文字颜色
  this.disabledTextColor, //按钮禁用时的文字颜色
  this.color, //按钮背景颜色
  this.disabledColor,//按钮禁用时的背景颜色
  this.highlightColor, //按钮按下时的背景颜色
  this.splashColor, //点击时，水波动画中水波的颜色
  this.colorBrightness,//按钮主题，默认是浅色主题 
  this.padding, //按钮的填充
  this.shape, //外形
  @required this.child, //按钮的内容
})""");
    // Fluttertoast.cancel(); // 直接退出的方法
  }
}
