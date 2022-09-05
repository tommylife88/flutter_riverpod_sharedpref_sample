import 'package:flutter/material.dart';
import 'package:flutter_riverpod_sharedpref_sample/page/home_page.dart';
import 'package:flutter_riverpod_sharedpref_sample/page/settings_page.dart';

// ignore: avoid_classes_with_only_static_members
abstract class Routes {
  static const home = '/';
  static const settingsPage = '/settingsPage';

  static Map<String, WidgetBuilder> routes = {
    home: (_) => const HomePage(),
    settingsPage: (_) => const SettingsPage(),
  };
}
