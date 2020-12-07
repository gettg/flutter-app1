/*
future 创建的 异步的方法，避免连环 then 的嵌套
*/

// 两个 test 是并行的执行
void main() {
  print("回调 地狱信息");
  test1();
  print("then-----------------");
  test2();
  print("async await");
  test3();
  print("async func");
  task2();
}

//先分别定义各个异步任务
Future<String> login(String userName, String pwd) {
  print("login User $userName, $pwd");
  return Future<String>.value("login");
  //用户登录
}

Future<String> getUserInfo(String id) {
  print("get User Info $id");
  return Future<String>.value("getUserInfo");
  //获取用户信息
}

Future saveUserInfo(String userInfo) {
  print("save User Info, $userInfo");
  // 保存用户信息
  return Future.value('end');
}

// then 的连环嵌套
void test1() {
  login("alice", "123").then((id) {
    //登录成功后通过，id获取用户信息
    getUserInfo(id).then((userInfo) {
      //获取用户信息后保存
      saveUserInfo(userInfo).then((end) {
        //保存用户信息，接下来执行其它操作
        print("$end end...");
      }).catchError((e) => print(e));
    });
  }).catchError((e) {
    print(e);
  });
}

//使用Future消除Callback Hell, 连续的 then 拼接
void test2() {
  login("alice", "******").then((id) {
    return getUserInfo(id);
  }).then((userInfo) {
    return saveUserInfo(userInfo);
  }).then((end) {
    print("$end test2");
  }).catchError((e) {
    //错误处理
    print(e);
  });
}

/*
async用来表示函数是异步的，定义的函数会返回一个Future对象，可以使用then方法添加回调函数。
await 后面是一个Future，表示等待该异步任务完成，异步完成后才会往下走；await必须出现在 async 函数内部
*/
// 使用async/await消除callback hell
void test3() {
  task() async {
    try {
      String id = await login("alice", "******");
      String userInfo = await getUserInfo(id);
      String end = await saveUserInfo(userInfo);
      print("$end test3");
      //执行接下来的操作
    } catch (e) {
      //错误处理
      print(e);
    }
  }

  task();
}

// async 函数
task2() async {
  try {
    String id = await login("alice", "******");
    String userInfo = await getUserInfo(id);
    String end = await saveUserInfo(userInfo);
    print("$end test3");
    //执行接下来的操作
  } catch (e) {
    //错误处理
    print(e);
  }
}
