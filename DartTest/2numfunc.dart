void main() {
  var i = 100;
  print(i.isEven);
  print(i.isOdd);
  print(i.isNaN);
  print(i.runtimeType);
/*
true
false
false
int
 */
  doublefunc();
}

void doublefunc() {
  print("doublefunc");
  var d = 100.89;
  print(d.abs());
  print(d.toInt());
  print(d.round());
/*
100.89
100
101
 */
  jisuan();
}

void jisuan() {
  print("计算数据");
  int b = 10;
  double a = 100.9;
  print(a / b);
  print(a + b);
  print(a * b);
  print(a ~/ b);
  print(a % b);
  /*
10.09
110.9
1009.0
10
0.9000000000000057
   */
}
