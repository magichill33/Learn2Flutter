import 'package:flutter/material.dart';
import './tabs/home.dart';
import './tabs/category.dart';
import './tabs/message.dart';
import './tabs/setting.dart';
import './tabs/user.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    HomePage(),
    CategoryPage(),
    MessagePage(),
    SettingPage(),
    UserPage()
  ];

  @override
  Widget build(BuildContext context) {
    print("build $_currentIndex");
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.red,
        title: Text('头条APP'),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 1,
                    child: UserAccountsDrawerHeader(
                      accountName: const Text("ly"),
                      accountEmail: const Text("lying@qq.com"),
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F202006%2F14%2F20200614201754_UdLFQ.jpeg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1680169364&t=14c6cc8bf0caa13333ee8dd89d0dd405"),
                        radius: 100,
                      ),
                      decoration:
                          const BoxDecoration(color: Colors.greenAccent),
                    ))
              ],
            ),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.people),
              ),
              title: Text("个人中心"),
            ),
            const Divider(),
            const ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.settings),
              ),
              title: Text("系统设置"),
            ),
            const Divider()
          ],
        ),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          //选中的颜色
          fixedColor: Colors.red,
          //如果底部有4个或者4个以上的菜单的时候就需要配置这个参数
          type: BottomNavigationBarType.fixed,
          onTap: (tappedItemIndex) => setState(() {
                _currentIndex = tappedItemIndex;
              }),
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
            BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
            BottomNavigationBarItem(icon: Icon(Icons.message), label: '消息'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置'),
            BottomNavigationBarItem(icon: Icon(Icons.people), label: '用户'),
          ]),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 2 ? Colors.red : Colors.blue,
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              _currentIndex = 2;
            });
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, //Change for different locations
    );
  }
}
