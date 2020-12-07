/*
Stream 也是用于接收异步事件数据，和Future 不同的是，它可以接收多个异步操作的结果（成功或失败）。 
也就是说，在执行异步任务时，可以通过多次触发成功或失败事件来传递结果数据或错误异常。
 Stream 常用于会多次读取数据的异步任务场景，如网络内容下载、文件读写等。
*/
// 适合一个连续事件 其中一个出错并不影响后者，适合程序启动，读取非必要配置信息
main(List<String> args) {
  Stream.fromFutures([
    // 1秒后返回结果
    Future.delayed(new Duration(seconds: 1), () {
      return "hello 1";
    }),
    // 抛出一个异常
    Future.delayed(new Duration(seconds: 2), () {
      throw AssertionError("Error");
    }),
    // 3秒后返回结果
    Future.delayed(new Duration(seconds: 3), () {
      return "hello 3";
    })
  ]).listen((data) {
    print(data);
  }, onError: (e) {
    print(e.message);
  }, onDone: () {
    print("end ...");
  });
}
//思考题：既然Stream可以接收多次事件，那能不能用Stream来实现一个订阅者模式的事件总线？
