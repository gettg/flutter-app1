/*
Map 键值对 golang map[string]interface{}
 */

void main() {
  var m1 = {"anme": "hello", "hell": 100.0};
  m1.forEach((key, value) {
    print("$key --> $value");
  });

  m1["name"] = "koco";
  print(m1["name"]);

  m1.remove("name");

  m1.clear();
}
