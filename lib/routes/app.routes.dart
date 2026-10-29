import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/info.dart';

class AppRoutes {
  static const String home = '/';
  static const String info = '/info';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    info: (_) => const InfoScreen(),
  };
}