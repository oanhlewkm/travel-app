import 'package:flutter/material.dart';
import 'package:new_app/representation/screen/intro_screen.dart';
import 'package:new_app/representation/screen/main_app.dart';
import 'package:new_app/representation/screen/slpash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp()
};
