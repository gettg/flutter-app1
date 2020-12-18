import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 声明文本样式
const textStyle = const TextStyle(
  fontFamily: 'Raleway',
);
// const TextStyle = const GoogleFonts.getFont('Lato');

void main() => runApp(AppIndex());

class AppIndex extends StatelessWidget {
  const AppIndex({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "text 的样式",
      home: Scaffold(
        appBar: AppBar(title: Text("text 样式")),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  void _onTop() {
    setState(() {
      print("点击...");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[50],
      child: ListView(
        children: [
          Text("data"),
          Text(
            "data textAlign center",
            textAlign: TextAlign.center, // 文本的对齐方式
          ),
          Text(
            "只显示一行数据 。。。。。。 " * 100,
            maxLines: 1, // 指定文本显示的最大行数
            overflow: TextOverflow.ellipsis, // 省略号
          ),
          Text(
            "Hello world * 1.5 Scale 比例",
            // 代表文本相对于当前字体大小的缩放因子，相对于去设置文本的样式style属性的fontSize，
            //它是调整字体大小的一个快捷方式。该属性的默认值可以通过MediaQueryData.textScaleFactor获得，
            //如果没有MediaQuery，那么会默认值将为1.0。
            textScaleFactor: 1.5,
          ),
          Text(
            "TextStyle style 样式",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.blue),
          ),
          Text(
            "Hello world",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 10.0,
                //该属性和Text的textScaleFactor都用于控制字体大小。但是有两个主要区别：
                // fontSize可以精确指定字体大小，而textScaleFactor只能通过缩放比例来控制。
                // textScaleFactor主要是用于系统字体大小设置改变时对Flutter应用字体进行全局调整，而fontSize通常用于单个文本，字体大小不会跟随系统字体大小变化。
                height:
                    1.2, // 该属性用于指定行高，但它并不是一个绝对值，而是一个因子，具体的行高等于fontSize*height
                fontFamily:
                    "Courier", //由于不同平台默认支持的字体集不同，所以在手动指定字体时一定要先在不同平台测试一下
                background: Paint()..color = Colors.green,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          Text(
            "TextSpan 片段，对一个Text内容的不同部分按照不同的样式显示",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.blue),
          ),
          Text.rich(TextSpan(
            children: [
              TextSpan(text: "Home: "),
              TextSpan(
                text: "https://gitee.com.tgkoco",
                style: TextStyle(color: Colors.blue),
                recognizer: _tapGestureRecognizer..onTap = _onTop,
              ),
            ],
          )),
          Text(
            "DefaultTextStyle 设置下方的所有子组件的样式",
            textScaleFactor: 1.2,
            style: TextStyle(color: Colors.blue),
          ),
          DefaultTextStyle(
            //1.设置文本默认样式
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("test 1"),
                Text("test 2"),
                Text(
                  "no default， 使用自己的样式信息",
                  style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            "style: GoogleFonts ",
            style: GoogleFonts.lato(fontStyle: FontStyle.italic),
          ),
          Text(
            "data",
            style: textStyle,
          )
        ],
      ),
    );
  }
}
