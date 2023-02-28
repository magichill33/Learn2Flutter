import 'package:flutter/material.dart';
import './pages/tabs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
    title: "News",
    theme: ThemeData(primarySwatch: Colors.lightBlue),
    home: Tabs(),);
  }
}