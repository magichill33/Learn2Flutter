import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mc_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? _message;
  late SharedPreferences sp;

  // 1、创建一个MethodChanel实例，传入通道名称，名称需要和Native侧完全一致
  static const _channel = MethodChannel('methodChannel');
  var url =
      'https://sample-videos.com/video123/flv/240/big_buck_bunny_240p_10mb.flv';

  Future<void> _incrementCounter() async {
    print('ly-Start second page');
    // var ack = await router.push(
    //     name: McRouter.playerPage, arguments: url);
    var name = sp.getString('name');
    print('ly-name:$name');
    var ack = await router.push(
        name: McRouter.videoListPage, arguments: 'Hello from mainPage');
    print('ly-Ack: $ack');

  }

  @override
  void initState() {
    super.initState();
    getFlutterInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have pushed the button this many times:"),
            Text(
              "$_message",
              style: Theme.of(context).textTheme.headlineMedium,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> getFlutterInfo() async {
    final Map<String, dynamic> map = {
      'name': 'flutter',
      'version': '3.0.1',
      'language': 'dart',
      'android_api': 31
    };
    String result = await _channel.invokeMethod('getFlutterInfo', map);
    print('Method invoke result: $result');
    print('map is : ${map['name']}');

    sp = await SharedPreferences.getInstance();
    sp.setString("name", map['name']);
  }
}
