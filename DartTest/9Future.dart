/*
Future与JavaScript中的Promise非常相似，表示一个异步操作的最终完成（或失败）及其结果值的表示。
简单来说，它就是用于处理异步操作的，异步处理成功了就执行成功的操作，异步处理失败了就捕获错误或者停止后续操作。
一个Future只会对应一个结果，要么成功，要么失败。
Future 的所有API的返回值仍然是一个Future对象，所以可以很方便的进行链式调用。
*/

import 'dart:io';

void main() {
  // 即2秒后返回结果字符串,并不是限制时间范围必须完成
  Future.delayed(new Duration(seconds: 2), () {
    // return "Future delayed 延迟!";
    sleep(Duration(seconds: 10)); // --> null
    throw AssertionError("一个错误信息");
  }).then((data) {
    print(data);
  }).catchError((e) {
    // 在catchError中捕获错误
    print(e);
  }).whenComplete(() {
    //无论成功或失败都会走到这里
  });
}

//有些时候，我们需要等待多个异步任务都执行结束后才进行一些操作，比如我们有一个界面，需要先分别从两个网络接口获取数据，
//获取成功后，我们需要将两个接口数据进行特定的处理后再显示到UI界面上，
//应该怎么做？答案是Future.wait，它接受一个Future数组参数，只有数组中所有Future都执行成功后，
//才会触发then的成功回调，只要有一个Future执行失败，就会触发错误回调。下面，我们通过模拟Future.delayed 来模拟两个数据获取的异步任务，
//等两个异步任务都执行成功时，将两个异步任务的结果拼接打印出来，代码如下：
void futureWait() {
  Future.wait([
    // 2秒后返回结果
    Future.delayed(new Duration(seconds: 2), () {
      return "hello";
    }),
    // 4秒后返回结果
    Future.delayed(new Duration(seconds: 4), () {
      return " world";
    })
  ]).then((value) => {}).catchError((e) => {print(e)}).whenComplete(() => {});
}
