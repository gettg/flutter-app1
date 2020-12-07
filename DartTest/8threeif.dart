/*
？ ：
三目运算符
？？ 取不为空的数据
 */

void main(){
  var name = "hello"!="hello"? "ok":"no";
  print(name);

  var bb=null??null??""??"name";// --> ""
   // bb=null??null??"name";// --> "name"
  print(bb);
 
  var b=true;

  var func= b?()=>{
    print("ok")
  }:()=>{
    print("err")
  };

  func();

  var c=100~/9;
  print(c);
  
  String s=(new StringBuffer()
    ..write("name :")
    ..write("koco")
    ..toString()) as String;
  print(s);

  // Runes he =(new StringBuffer()
  //   ..write("name :")
  //   ..write("koco")
  //   ..toString()) as Runes ;//type 'StringBuffer' is not a subtype of type 'String' in type cast
  // print(he);

  var hel =(new StringBuffer()
    ..write("name :")
    ..write("koco")
    ..toString()) ;//type 'StringBuffer' is not a subtype of type 'String' in type cast
  print(hel);

}