import 'package:flutter/material.dart';
import '../../tools/KeepAliveWrapper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
    //监听_tabController的改变事件
    _tabController.addListener(() {
      if (_tabController.animation!.value == _tabController.index) {
        print("_tabController ${_tabController.index}");
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          //配置appBar的高度
          preferredSize: const Size.fromHeight(40),
          child: AppBar(elevation: 5,
            backgroundColor: Colors.white,
            title: SizedBox(
              //设置 TabBar 高度
              height: 30,
              child: TabBar(
                labelStyle: const TextStyle(fontSize: 14),
                isScrollable: true,
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                controller: _tabController,
                tabs: const [
                  Tab(child: Text("关注")),
                  Tab(child: Text("热门")),
                  Tab(child: Text("附近")),
                  Tab(child: Text("朋友")),
                  Tab(child: Text("资讯")),
                  Tab(child: Text("美食")),
                  Tab(child: Text("其他")),
                  Tab(child: Text("我的")),
                ],
              ),
            ),),
        ),
        body: TabBarView(controller: _tabController, children: [
          KeepAliveWrapper(child: ListView(children: [
            ListTile(title: Text("我是关注列表1"),),
            ListTile(title: Text("我是关注列表2"),),
            ListTile(title: Text("我是关注列表3"),),
            ListTile(title: Text("我是关注列表4"),),
            ListTile(title: Text("我是关注列表5"),),
            ListTile(title: Text("我是关注列表6"),),
            ListTile(title: Text("我是关注列表7"),),
            ListTile(title: Text("我是关注列表8"),),
            ListTile(title: Text("我是关注列表9"),),
            ListTile(title: Text("我是关注列表10"),),
            ListTile(title: Text("我是关注列表11"),),
            ListTile(title: Text("我是关注列表12"),),
            ListTile(title: Text("我是关注列表13"),),
            ListTile(title: Text("我是关注列表14"),),
            ListTile(title: Text("我是关注列表15"),),
          ],)),
          Text("我是热门"),
          Text("我是附近"),
          Text("我是朋友"),
          Text("我是资讯"),
          Text("我是美食"),
          Text("我是其它"),
          Text("我是我的")
        ])
    );
  }
}
