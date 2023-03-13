import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import './nav2/mc_router.dart';
import 'package:player/player.dart';

void main() {
  runApp(const MyApp());
  init();
}

init() {
  getExternalStorageDirectory().then((value) {
    if (value != null) {
      Player.setCachePath(value!.path);

    }
    print('ly- sdcard path: ${value?.path}');
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Nav2 Demo",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Router(
        routerDelegate: router,
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
