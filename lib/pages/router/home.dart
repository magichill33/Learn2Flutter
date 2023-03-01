import 'package:flutter/material.dart';
import '../../tools/KeepAliveWrapper.dart';
import '../search.dart';
import '../../tools/config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    print("_HomePageState ${PageName.form.name}");
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
                Navigator.pushNamed(context, PageName.news.name);
              },
              child: const Text("命名路由跳转news")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageName.form.name,
                arguments: {"title": "我是命名路由传值", "aid": 20});
              },
              child: const Text("命名路由传值")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageName.dialog.name);
              },
              child: const Text("对话框模块")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageName.pageView.name);
              },
              child: const Text("PageView")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageName.pageViewBuilder.name);
              },
              child: const Text("PageViewBuilder")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageName.pageViewFull.name);
              },
              child: const Text("动态添加页面")),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, PageName.pageViewSwiper.name);
              },
              child: const Text("轮播图")),
        ],
      ),
    );
  }
}
