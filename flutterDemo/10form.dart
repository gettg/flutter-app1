import 'package:flutter/material.dart';

// form 表单的提交
// https://book.flutterchina.club/chapter3/input_and_form.html
void main(List<String> args) {
  runApp(FormPage());
}

class FormPage extends StatelessWidget {
  const FormPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "表单",
      home: FormIndex(),
    );
  }
}

class FormIndex extends StatefulWidget {
  FormIndex({Key key}) : super(key: key);

  @override
  _FormIndexState createState() => _FormIndexState();
}

class _FormIndexState extends State<FormIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FormBody(),
    );
  }
}

class FormBody extends StatefulWidget {
  FormBody({Key key}) : super(key: key);

  @override
  _FormBodyState createState() => _FormBodyState();
}

class _FormBodyState extends State<FormBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("form demo"),
    );
  }
}
