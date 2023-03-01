import 'package:flutter/material.dart';
import '../../tools/KeepAliveWrapper.dart';
import '../search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return const SearchPage();
                }));
              },
              child: const Text("基本路由中转search")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/news");
              },
              child: const Text("命名路由跳转news")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/form",
                arguments: {"title": "我是命名路由传值", "aid": 20});
              },
              child: const Text("命名路由传值")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/dialog");
              },
              child: const Text("对话框模块")),
        ],
      ),
    );
  }
}
