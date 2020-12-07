

/*
List 数组  golang 中的 []interface{}
 */

void main(){

  print("list show using");

  // create list
  var l1=[1,2,4,5666,"name","A",0000.111];
  print(l1);

  // create by build func

  var list2=new List();
  list2.add("value");
  list2.add("value1");
  var a=list2.elementAt(1);//从0 开始的
  print("$list2 + \n $a");
   // a=list2.elementAt(4);//超出范围 RangeError (index): Invalid value: Not in inclusive range 0..1: 4
  print("list 10 -->$a");


  // 创建一个不可变的 List
  var l3= const [2,100.99,4,5,"const"];
  //l3[1]=100.0;//Unsupported operation: Cannot modify an unmodifiable list
  // print(l3.remove(2));// Unsupported operation: Cannot remove from an unmodifiable list


  // func
  print("finc list");
  list2.length;
  list2.shuffle();// 随机打乱
  list2.forEach((element) {
    print(element);
  });
}