import 'package:flutter/material.dart';
import './pages/router/controller.dart';
import './tools/config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News",
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      //home: Tabs(),
      initialRoute: PageName.root.name,
      // routes: {
      //   "/": (context) => const Tabs(),
      //   "/news": (context) => const NewsPage(),
      //   "/search": (context) => const SearchPage(),
      //   "/form": (context) => const FormPage()
      // },
      onGenerateRoute: onGenerateRoute,
    );
  }
}
