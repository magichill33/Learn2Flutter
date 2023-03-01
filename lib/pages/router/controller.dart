import 'package:flutter/material.dart';

import '../dialog/dialog.dart';
import '../form.dart';
import '../news.dart';
import '../routers.dart';
import '../search.dart';

final Map<String, Function> routers = {
  "/": (context) => const Tabs(),
  "/news": (context) => const NewsPage(),
  "/search": (context) => const SearchPage(),
  "/form": (context, {arguments}) => FormPage(
        arguments: arguments,
      ),
  "/dialog": (context, {arguments}) => DialogPage(),
};

var onGenerateRoute = (RouteSettings settings) {
  //统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routers[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
  return null;
};
