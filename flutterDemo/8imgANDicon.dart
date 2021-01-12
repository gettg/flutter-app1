import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
