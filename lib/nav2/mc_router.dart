import 'dart:async';

import 'package:flutter/material.dart';
import 'home_page.dart';
import 'second_page.dart';
import 'player_page.dart';
import '../video_page/video_list.dart';

McRouter router = McRouter();

/**
 *
 * @author : liuyi
 * @created on : 2023/3/7 19:55
 * @description :
 */
class McRouter extends RouterDelegate<List<RouteSettings>>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>> {
  static const String mainPage = '/main';
  static const String secondPage = '/second';
  static const String playerPage = '/player';
  static const String videoListPage = 'video_list';

  static const String key = 'key';
  static const String value = 'value';

  final List<Page> _pages = [];

  late Completer<Object?> _boolResultCompleter;

  McRouter() {
    _pages.add(_createPage(const RouteSettings(name: mainPage, arguments: [])));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: List.of(_pages),
      onPopPage: _onPopPage,
    );
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey {
    return GlobalKey<NavigatorState>();
  }

  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async {
    print('setNewRoutePath $configuration');

    return;
  } // @override
  // Future<Function> setNewRoutePath(List<RouteSettings> configuration) async {}

  @override
  Future<bool> popRoute() {
    // if (param != null) {
    //   _boolResultCompleter.complete(params);
    // }
    if (_canPop()) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }

    return _confirmExit();
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    if (_canPop()) {
      _pages.removeLast();
      return true;
    } else {
      return false;
    }
  }

  // 判断page栈长度，为空则即将退出App；不为空则返回true表示页面关闭
  bool _canPop() {
    return _pages.length > 1;
  }

  MaterialPage _createPage(RouteSettings routeSettings) {
    Widget page;
    switch (routeSettings.name) {
      case mainPage:
        page = const MyHomePage(title: 'My Home Page');
        break;
      case secondPage:
        page = SecondPage(params: routeSettings.arguments?.toString() ?? '');
        break;
      case playerPage:
        page = PlayerPage(routeSettings.arguments?.toString() ?? '');
        break;
      case videoListPage:
        page = VideoList();
        break;
      default:
        page = const Scaffold();
    }
    return MaterialPage(
        child: page,
        key: Key(routeSettings.name!) as LocalKey,
        name: routeSettings.name,
        arguments: routeSettings.arguments);
  }

  Future<bool> _confirmExit() async {
    final result = await showDialog<bool>(
      context: navigatorKey.currentContext!,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('确认退出吗'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, true),
                child: const Text('取消')),
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('确定'))
          ],
        );
      },
    );
    return result ?? true;
  }

  void replace({required String name, dynamic arguments}) {
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(name: name, arguments: arguments);
  }

  Future<Object?> push({required String name, dynamic arguments}) async {
    _boolResultCompleter = Completer<Object?>();
    _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
    notifyListeners();
    return _boolResultCompleter.future;
  }
}
