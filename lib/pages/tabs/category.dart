import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      ListTile(title: Text("我是列表1")),
      ListTile(title: Text("我是列表2")),
      ListTile(title: Text("我是列表3")),
      ListTile(title: Text("我是列表4")),
      ListTile(title: Text("我是列表5")),
      ListTile(title: Text("我是列表6")),
      ListTile(title: Text("我是列表7")),
      ListTile(title: Text("我是列表8"))
    ]);
  }
}
