



void main(){
print("string 字符串");
var s1='''anslakn
ssss''';

var s2="s2";
var s3='s3';
var s4=r'加个r 做什么？';
var s5 ='kong';

print(s1.isEmpty);
print(s2.length);
print(s3.replaceAll('from', "replace"));
print(s4.split("pattern"));
print(s5.startsWith("k"));
/*
string 字符串
false
2
s3
[加个r 做什么？]
true
 */

  FuncAssert();
}

void FuncAssert(){
  print("FuncAssert assert 断言");
  var b='';
  var c=b.isEmpty;

  print(c);
  assert (c==true);// 断言函数 不为真 终止程序不往下走。
  print("assert 断言函数");

  var nullValue;
  print(nullValue==null);
  assert (nullValue=="s");
  print("assert Null Value is 's' ");

  /*
  FuncAssert assert 断言
true
assert 断言函数
true
Unhandled exception:
'file:///home/koco/flutterDemo/app1/DartTest/3string.dart': Failed assertion: line 43 pos 11: '<optimized out>': is not true.

   */
}