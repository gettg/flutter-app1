void main() {
  var str = " ?";
  String a = "name";

  var num = 100.0;
  print("Hello koco $a $str $num");

  FinalAndConst();
  DataType();
}

final OldAge = 100;

void FinalAndConst() {
  final a = 'this is final'; // 第一次使用就是常量信息
  // a="sss";
  print("$a");
  const aa = 93; // 编译时的常量信息
  print("$aa");
  // aa=98;
}

void DataType() {
  int i = 100;
  double d = 100.00;
  num nn = 222.99; // num 是 int 和 double 的父类
  String s = "string";
  bool b = true;

  List ll = List(10);
  // List ll=new List(10);
// List ll=List<String>(10);
  ll[0] = 1;
  ll[9] = "string type";
  print("$ll");

  Map mmp = Map();
  // Map mmp=new Map();
  mmp["sa"] = "str";
  print("$mmp");

  // Runes ; 符号字符
  // Symble; 标识符
}
