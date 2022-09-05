import 'package:flutter/material.dart';
import 'package:flutter_riverpod_sharedpref_sample/routes.dart';

class AppNavigator {
  factory AppNavigator() {
    return _instance;
  }
  AppNavigator._();
  static final AppNavigator _instance = AppNavigator._();

  void pop(
    BuildContext context,
  ) {
    Navigator.of(context).pop();
  }

  void navToSettingsPage(
    BuildContext context,
  ) {
    Navigator.of(context).pushNamed(Routes.settingsPage);
  }
}
