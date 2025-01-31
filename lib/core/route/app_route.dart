import 'package:flutter/cupertino.dart';

import '../../features/example/config/example_route.dart';
import '../../features/splash/config/splash_route.dart';

class AppRoute {
  final Map<String, WidgetBuilder> _screens = {};

  AppRoute() {
    _screens
      ..addAll(Ex1Route.screens)
      ..addAll(ExampleRoute.screens);
  }

  Map<String, WidgetBuilder> get screens => _screens;
}
