import 'package:flutter/material.dart';

import '../dialog/dialog.dart';
import '../form.dart';
import '../news.dart';
import '../routers.dart';
import '../search.dart';
import '../page_view.dart';
import '../../tools/config.dart';
import '../page_view.dart';
import '../page_view_builder.dart';
import '../page_view_full.dart';
import '../page_view_swiper.dart';

final Map<String, Function> routers = {
  PageName.root.name: (context) => const Tabs(),
  PageName.news.name: (context) => const NewsPage(),
  PageName.search.name: (context) => const SearchPage(),
  PageName.form.name: (context, {arguments}) => FormPage(
        arguments: arguments,
      ),
  PageName.dialog.name: (context, {arguments}) => DialogPage(),
  PageName.pageView.name: (context) => const PageViewPage(),
  PageName.pageViewBuilder.name: (context) => const PageViewBuilderPage(),
  PageName.pageViewFull.name: (context) => const PageViewFullPage(),
  PageName.pageViewSwiper.name: (context) => const PageViewSwiper(),
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
