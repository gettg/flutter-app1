import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '6text.dart';

void main() => runApp(ImgIconIndex());

String GetTitle() {
  return "Img Icon 用法";
}

class ImgIconIndex extends StatelessWidget {
  const ImgIconIndex({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: GetTitle(),
      home: IndexPage(),
    );
  }
}

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(GetTitle())),
      body: ListView(
        cacheExtent: 100,
        children: [
          // assets 加载图片
          Image(image: AssetImage("assets/img/a.png"), height: 100.0),
          Image.asset("assets/img/a.png", height: 100.0),

          //  网络加载
          Image(
            image: NetworkImage(
                "https://avatars3.githubusercontent.com/u/32809471?s=200&v=4"),
            height: 100.0,
          ),
          Image.network(
            "https://avatars3.githubusercontent.com/u/32809471?s=200&v=4",
            height: 100.0,
          ),

          Center(
            child: Column(
              children: [
                Text(
                  "加载内存 Image.memory(bytes)",
                ),
                Text("加载文件 Image.file(file)"),
                OutlineButton(child: Text("param"), onPressed: _showArgs),
              ],
            ),
          ),
          Image(
            image: AssetImage("assets/img/a.png"),
            height: 100.0,
            color: Colors.red,
            colorBlendMode: BlendMode.plus,
          ),
          Image(
            image: AssetImage("assets/img/a.png"),
            width: 100.0,
            height: 100.0,
            repeat: ImageRepeat.repeatX,
          ),
          RaisedButton(
              child: Text("image 的填充模式"),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return FitImage();
                      },
                    ),
                  )),
          RaisedButton(
              child: Text("Icon 展示"),
              onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return IconShow();
                      },
                    ),
                  ))
        ],
      ),
    );
  }

  void _showArgs() {
    Fluttertoast.showToast(msg: """
                        const Image({
                          this.width, //图片的宽
                          this.height, //图片高度
                          this.color, //图片的混合色值
                          this.colorBlendMode, //混合模式
                          this.fit,//缩放模式
                          this.alignment = Alignment.center, //对齐方式
                          this.repeat = ImageRepeat.noRepeat, //重复方式
                        })
                        """);
  }
}

class IconShow extends StatefulWidget {
  IconShow({Key key}) : super(key: key);

  @override
  _IconShowState createState() => _IconShowState();
}

// icon 矢量图片
class _IconShowState extends State<IconShow> {
  String getIcon() {
    String icons = "图标和文字混合输出：";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return icons;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Text(
            getIcon(),
            style: TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green),
          ),
          // Text(
          //   "icon 的组件",
          //   style: TextStyle(
          //     color: Colors.white70,
          //     fontSize: 50,
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "icon 组件的填充数据：",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.cyanAccent,
                ),
              ),
              Icon(
                Icons.accessible,
                color: Colors.green,
                size: 70,
              ),
              Icon(
                Icons.error,
                color: Colors.green,
              ),
              Icon(
                Icons.fingerprint,
                color: Colors.green,
              ),
            ],
          ),
          Text("自己添加图标库： 操作步骤，iconfont 添加图标到项目，进行下载 ttf 格式"),
          Text("外部资源的加载需要重新打包，颜色都会消失"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(MyIcons.frock1, color: Colors.purple),
              Icon(MyIcons.panties1, color: Colors.green),
              Icon(MyIcons.pants1, color: Colors.purple),
              Icon(MyIcons.stockings1, color: Colors.green),
            ],
          )
        ],
      ),
    );
  }
}

class FitImage extends StatelessWidget {
  const FitImage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var img = AssetImage("assets/img/a.png");
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
            children: <Image>[
          Image(
            image: img,
            height: 50.0,
            width: 100.0,
            fit: BoxFit.fill,
          ),
          Image(
            image: img,
            height: 50,
            width: 50.0,
            fit: BoxFit.contain,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 50.0,
            fit: BoxFit.cover,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 50.0,
            fit: BoxFit.fitWidth,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 50.0,
            fit: BoxFit.fitHeight,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 50.0,
            fit: BoxFit.scaleDown,
          ),
          Image(
            image: img,
            height: 50.0,
            width: 100.0,
            fit: BoxFit.none,
          ),
          Image(
            image: img,
            width: 100.0,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
            fit: BoxFit.fill,
          ),
          Image(
            image: img,
            width: 100.0,
            height: 200.0,
            repeat: ImageRepeat.repeatY,
          )
        ].map((e) {
          return Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: SizedBox(
                  width: 100,
                  child: e,
                ),
              ),
              Text(e.fit.toString())
            ],
          );
        }).toList()),
      ),
    );
  }
}

// {
//   "icon_id": "19219569",
//   "name": "上衣-01",
//   "font_class": "shangyi-01",
//   "unicode": "e610",
//   "unicode_decimal": 58896
// },
// {
//   "icon_id": "19219770",
//   "name": "短裤-02",
//   "font_class": "shangyi-02",
//   "unicode": "e611",
//   "unicode_decimal": 58897
// },
// {
//   "icon_id": "19219771",
//   "name": "内裤-03",
//   "font_class": "shangyi-03",
//   "unicode": "e612",
//   "unicode_decimal": 58898
// },
// {
//   "icon_id": "19219790",
//   "name": "袜子-04",
//   "font_class": "shangyi-04",
//   "unicode": "e613",
//   "unicode_decimal": 58899
// }

class MyIcons {
  // 上衣-01
  static const IconData frock1 =
      const IconData(0xe610, fontFamily: 'myIcon', matchTextDirection: true);
  // 短裤-02
  static const IconData pants1 =
      const IconData(0xe611, fontFamily: 'myIcon', matchTextDirection: true);
  // 内裤-03
  static const IconData panties1 =
      const IconData(0xe612, fontFamily: 'myIcon', matchTextDirection: true);
  //袜子-04
  static const IconData stockings1 =
      const IconData(0xe613, fontFamily: 'myIcon', matchTextDirection: true);
}
