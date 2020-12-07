import 'dart:async';
// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Future 表示一个异步的操作
Future<Post> fetchPost() async {
  final response = await http.get('https://baidu.com');
  final responseJson = response.body;

  return new Post.toShow(responseJson);
}

class Post {
  final String body;

// 构造方法 可选参数
  Post({this.body});

  factory Post.toShow(String json) {
    return new Post(body: json);
  }

  // factory Post.fromJson(Map<String, dynamic> json) {
  //   return new Post(
  //     title: json['title'],
  //     body: json,
  //   );
  // }
}

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Fetch Data Example',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Fetch Data Example'),
        ),
        body: new Center(
          child: new FutureBuilder<Post>(
            future: fetchPost(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return new Text(snapshot.data.body);
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
