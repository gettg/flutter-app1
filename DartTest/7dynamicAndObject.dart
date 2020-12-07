/*
dynamic 动态，不做类型检查，调用一个不存在的方法，会执行 noSuchMethod()
object 对象 ,调用一个不存在的方法，会抛出 NoSuchMethodError

 */
void main() {
  dynamicFunc();
  objFunc();
}

void objFunc() {
  String obj="name";
  if (obj is String){
    print(obj);
  }

  var map=obj as Map<String,int>;
  print(map);
  
  // obj["name"]="hello";// 直接编译错误
}

void dynamicFunc() {
  dynamic obj = <String,String>{};
  if (obj is String){
    print(obj);
  }
  obj=obj as Map<String,String>;

  obj["age"] = "hello";//编译通过 执行错误
  print(obj);
  // NoSuchMethodError: Class 'String' has no instance method '[]='.
}
