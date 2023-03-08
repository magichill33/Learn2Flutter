import 'package:flutter/material.dart';

import './nav2/mc_router.dart';


void main() {
  runApp(const MyApp());
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
