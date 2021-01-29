import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Material组件库中提供了输入框组件TextField和表单组件Form。下面我们分别介绍一下。

void main(List<String> args) {
  runApp(inPutApp());
}

class inPutApp extends StatelessWidget {
  const inPutApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "输入框",
      // // 处理Named页面跳转 传递参数                        无效
      // onGenerateRoute: (RouteSettings setting) {
      //   if (setting.name == 'two2') {
      //     return MaterialPageRoute(
      //         builder: (context) =>
      //             FocusTestRoute(isPage: setting.arguments['isPage']));
      //   }
      // },

      routes: {
        "two2": (context) => FocusTestRoute(
              isPage: true,
            ), // 指定参数信息，进行跳转，可使用不同的参数代表不同的路由
      },
      home: HomeInput(),
    );
  }
}

class HomeInput extends StatefulWidget {
  HomeInput({Key key}) : super(key: key);

  @override
  _HomeInputState createState() => _HomeInputState();
}

class _HomeInputState extends State<HomeInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("输入框"),
      ),
      body: ListView(
        children: [TextFieldInput()],
      ),
    );
  }
}

// TextFieldInput 输入框的展示
class TextFieldInput extends StatefulWidget {
  TextFieldInput({Key key}) : super(key: key);

  @override
  _TextFieldInputState createState() => _TextFieldInputState();
}

class _TextFieldInputState extends State<TextFieldInput> {
  //定义一个controller
  TextEditingController _unameController = TextEditingController();

  TextEditingController _selectionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _unameController.addListener(() {
      print(_unameController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    /*
    注意： 字段的含义可点击字段查看注释信息，这里一些来自 参考资料的翻译。

    controller：编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件。
    大多数情况下我们都需要显式提供一个controller来与文本框交互。如果没有提供controller，则TextField内部会自动创建一个。

    focusNode：用于控制TextField是否占有当前键盘的输入焦点。它是我们和键盘交互的一个句柄（handle）。
    
    InputDecoration：用于控制TextField的外观显示，如提示文本、背景颜色、边框等

    keyboardType：用于设置该输入框默认的键盘输入类型，取值如下：
        text	文本输入键盘
        multiline	多行文本，需和maxLines配合使用(设为null或大于1)
        number	数字；会弹出数字键盘
        phone	优化后的电话号码输入键盘；会弹出数字键盘并显示“* #”
        datetime	优化后的日期输入键盘；Android上会显示“: -”
        emailAddress	优化后的电子邮件地址；会显示“@ .”
        url	优化后的url输入键盘； 会显示“/ .”

    textInputAction：键盘动作按钮图标(即回车键位图标)，它是一个枚举值，
    有多个可选值，全部的取值列表读者可以查看API文档，下面是当值为TextInputAction.search时，
    原生Android系统下键盘样式 一个搜索图标按钮

    style：正在编辑的文本样式。

    textAlign: 输入框内编辑文本在水平方向的对齐方式。

    autofocus: 是否自动获取焦点。

    obscureText：是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换

    maxLines：输入框的最大行数，默认为1；如果为null，则无行数限制。

    maxLength和maxLengthEnforced ：maxLength代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数。
    maxLengthEnforced决定当输入文本长度超过maxLength时是否阻止输入，为true时会阻止输入，为false时不会阻止输入但输入框会变红。

    onChange：输入框内容改变时的回调函数；注：内容改变事件也可以通过controller来监听。

    onEditingComplete和onSubmitted：这两个回调都是在输入框输入完成时触发，比如按了键盘的完成键
    （对号图标）或搜索键（🔍图标）。不同的是两个回调签名不同，onSubmitted回调是ValueChanged<String>类型，
    它接收当前输入内容做为参数，而onEditingComplete不接收参数。

    inputFormatters：用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验。

    enable：如果为false，则输入框会被禁用，禁用状态不接收输入和事件，同时显示禁用态样式（在其decoration中定义）。

    cursorWidth、cursorRadius和cursorColor：这三个属性是用于自定义输入框光标宽度、圆角和颜色的。

    */

    _selectionController.text = "hello world!";
    _selectionController.selection = TextSelection(
        baseOffset: 2, extentOffset: _selectionController.text.length);

    return Column(
      children: [
        TextField(
          autofocus: true, //是否自动获取焦点。
          //两种方式相比，onChanged是专门用于监听文本变化，
          //而controller的功能却多一些，除了能监听文本变化外，它还可以设置默认值、选择文本.
          controller: _unameController, //设置controller
          onChanged: (value) {
            print("onChange: $value");
          },
          decoration: InputDecoration(
              // 在文本周边显示的装饰
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock)),
          obscureText: true, // 模糊字段  ，不能为多行
        ),
        TextField(
          controller: _selectionController,
          onChanged: (value) {
            print(_selectionController.value);
          },
          decoration: InputDecoration(
              labelText: "select", icon: Icon(Icons.ac_unit_rounded)),
        ),
        RaisedButton(
          child: Text("two"),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              // MaterialPageRoute 传递参数 （笨方法）
              builder: (context) => FocusTestRoute(
                isPage: true,
              ),
            ),
          ),
        ),
        // 填充到框中
        Container(
          child: FocusTestRoute(),
        ),
        //
        Container(
          child: ThemeInput(),
        )
      ],
    );
  }
}

// 由于TextField在绘制下划线时使用的颜色是主题色里面的hintColor，
//但提示文本颜色也是用的hintColor， 如果我们直接修改hintColor，
//那么下划线和提示文本的颜色都会变。值得高兴的是decoration中可以设置hintStyle，
//它可以覆盖hintColor，并且主题中可以通过inputDecorationTheme来设置输入框默认的decoration。
//所以我们可以通过主题来自定义，
class ThemeInput extends StatefulWidget {
  ThemeInput({Key key}) : super(key: key);

  @override
  _ThemeInputState createState() => _ThemeInputState();
}

class _ThemeInputState extends State<ThemeInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Theme(
          // 默认的样式信息
          data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200], //定义下划线颜色
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                hintStyle:
                    TextStyle(color: Colors.grey, fontSize: 20.0) //定义提示文本样式
                ),
          ),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或邮箱",
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: "密码",
                  hintText: "您的登录密码",
                  // 组件自己的样式，覆盖默认的样式
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
                ),
                obscureText: true,
              ),
            ],
          ),
        ),
        // 以上 成功的自定义了下划线颜色和提问文字样式，细心的读者可能已经发现，、
        //通过这种方式自定义后，输入框在获取焦点时，labelText不会高亮显示了，
        //正如上图中的"用户名"本应该显示蓝色，但现在却显示为灰色，并且我们还是无法定义下划线宽度。
        //另一种灵活的方式是直接隐藏掉TextField本身的下划线，然后通过Container去嵌套定义样式，

        // DO 优先通过decoration来自定义样式，如果decoration实现不了，再用widget组合的方式
        Container(
          child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "电子邮件地址",
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none //隐藏下划线
                  )),
          decoration: BoxDecoration(
              // 下滑线浅灰色，宽度1像素
              border: Border(
                  bottom: BorderSide(color: Colors.grey[200], width: 1.0))),
        )
      ],
    );
  }
}

class FocusTestRoute extends StatefulWidget {
  const FocusTestRoute({Key key, this.isPage = false}) : super(key: key);

// 是否是页面
  final bool isPage;
  @override
  _FocusTestRouteState createState() => new _FocusTestRouteState();
}

class _FocusTestRouteState extends State<FocusTestRoute> {
  // FocusNode继承自ChangeNotifier，通过FocusNode可以监听焦点的改变事件，
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  Widget getPadding() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
            focusNode: focusNode1, //关联focusNode1
            decoration: InputDecoration(labelText: "input1"),
          ),
          TextField(
            focusNode: focusNode2, //关联focusNode2
            decoration: InputDecoration(labelText: "input2"),
          ),
          Builder(
            builder: (ctx) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点到 2"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                      }
                      if (focusNode2.hasFocus) {
                        print("-----------focusNode2 is focus");
                      } else {
                        focusScopeNode.requestFocus(focusNode2);
                      }
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘,取消所有焦点"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  ),
                ],
              );
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "请输入用户名",
              prefixIcon: Icon(Icons.person),
              // 未获得焦点下划线设为灰色
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red),
              ),
              //获得焦点下划线设为蓝色
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // 监听添加到 build 和 init status 同样的效果
    super.initState();
    focusNode1.addListener(() {
      print("add listener :${focusNode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    // focusNode1.addListener(() {
    //   print("add listener :${focusNode1.hasFocus}");
    // });

    if (widget.isPage) {
      return Scaffold(
        appBar: AppBar(),
        body: getPadding(),
      );
    }
    return getPadding();
  }
}
