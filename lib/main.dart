import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyAPP());

class MyAPP extends StatelessWidget {
  // 随机生成 字母
  // final wordPair = WordPair.random();
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // app 的名称
      title: "koco test1",
      theme: new ThemeData(
        // app 的主题内容
        primaryColor: Colors.white,
      ),
      home: RandomWordsList(),
      // 一个 动态页面生成 文字
      //RandomWords(),
      // 在 MyAPP中直接生成文字
      // new Center(
      //     // 显示原文字和 首字母大写的文字
      //     // child: Text(wordPair.toString() + wordPair.asPascalCase),

      //     ),
    );
  }
}

class RandomWords extends StatefulWidget {
  RandomWords({Key key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  Widget build(BuildContext context) {
    // 随机生成 字母
    final wordPair = WordPair.random();

    return Container(
      child: Center(child: Text(wordPair.asPascalCase)),
    );
  }
}

class RandomWordsList extends StatefulWidget {
  @override
  _RandomWordsListState createState() => _RandomWordsListState();
}

class _RandomWordsListState extends State<RandomWordsList> {
  final _suggestions = <WordPair>[];

  final _biggerFont = const TextStyle(fontSize: 18.0);

  final _saved = new Set<WordPair>();

  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();

          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          // 如果是建议列表中最后一个单词对
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  // 单独一个内容列表信息
  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }

// 当用户点击导航栏中的列表图标时，建立一个路由并将其推入到导航管理器栈中。此操作会切换页面以显示新路由。
//新页面的内容在在MaterialPageRoute的builder属性中构建，builder是一个匿名函数。
//添加Navigator.push调用，这会使路由入栈（以后路由入栈均指推入到导航管理器的栈）
  void _pushSaved() {
    Navigator.of(context).push(
      // 添加MaterialPageRoute及其builder
      new MaterialPageRoute(
        builder: (context) {
          // 获取保存列表信息中的数据
          final tiles = _saved.map(
            (pair) {
              return new ListTile(
                title: new Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          // 生成列表
          final divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return new Scaffold(
            appBar: new AppBar(
              title: new Text('保存的单词'),
            ),
            body: new ListView(children: divided),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // 标头信息
      appBar: new AppBar(
        title: new Text("hello koco"),
        // 添加一个操作，绑定点击事件
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved),
        ],
      ),
      body: new Container(child: _buildSuggestions()),
    );
  }
}
