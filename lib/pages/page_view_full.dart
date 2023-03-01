import 'package:flutter/material.dart';

//动态增加页面示例
class PageViewFullPage extends StatefulWidget {
  const PageViewFullPage({Key? key}) : super(key: key);

  @override
  State<PageViewFullPage> createState() => _PageViewFullPageState();
}

class _PageViewFullPageState extends State<PageViewFullPage> {
  List<Widget> list = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < 10; i++) {
      list.add(Center(
        child: Text(
          "第${i + 1}页",
          style: const TextStyle(fontSize: 60),
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PageViewFull'),
        ),
        body: PageView(
          scrollDirection: Axis.vertical,
          onPageChanged: (index) {
            setState(() {
              for (var i = 0; i < 10; i++) {
                list.add(Center(
                  child: Text(
                    "第${i + 1}页",
                    style: const TextStyle(fontSize: 60),
                  ),
                ));
              }
            });
          },
          children: list,
        ));
  }
}
