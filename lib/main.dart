import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "购物车",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter App")),
        body: _MyStateless(),
      ),
    );
  }
}

class _MyStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: [
        Row(
          children: [
            Text(
              "热搜",
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        Divider(),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            Button("女装", onPressed: () {}),
            Button("笔记本", onPressed: () {}),
            Button("玩具", onPressed: () {}),
            Button("文学", onPressed: () {}),
            Button("女装", onPressed: () {}),
            Button("时尚", onPressed: () {}),
            Button("男装", onPressed: () {}),
            Button("篮球", onPressed: () {}),
            Button("手机", onPressed: () {}),
            Button("ipad", onPressed: () {}),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text(
              "历史记录",
              style: Theme.of(context).textTheme.titleLarge,
            )
          ],
        ),
        Divider(),
        Column(
          children: [
            ListTile(
              title: Text("女装"),
            ),
            Divider(),
            ListTile(
              title: Text("手机"),
            ),
            Divider(),
            ListTile(
              title: Text("电脑"),
            ),
            Divider()
          ],
        ),
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: EdgeInsets.all(40),
          child: OutlinedButton.icon(
              onPressed: () {},
              //自适应
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.redAccent)),
              icon: Icon(Icons.delete),
              label: Text("清空历史记录")),
        ),
      ],
    );
  }
}

//自定义按钮组件
class Button extends StatelessWidget {
  String text;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: this.onPressed,
      child: Text(text),
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(Color.fromARGB(222, 222, 222, 219)),
          foregroundColor: MaterialStateProperty.all(Colors.black45)),
    );
  }

  Button(this.text, {Key? key, required this.onPressed}) : super(key: key);
}
