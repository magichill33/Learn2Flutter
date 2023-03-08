import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'mc_router.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String? _message;

  // 1、创建一个MethodChanel实例，传入通道名称，名称需要和Native侧完全一致
  static const _channel = MethodChannel('methodChannel');

  Future<void> _incrementCounter() async {
    print('Start second page');
    var ack = await router.push(
        name: McRouter.secondPage, arguments: 'Hello from mainPage');
    print('Ack: $ack');
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
  }
}