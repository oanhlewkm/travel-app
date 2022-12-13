import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_app/core/constants/color_palatte.dart';
import 'package:new_app/representation/screen/slpash_screen.dart';
import 'package:new_app/routes.dart';

const travelBox = 'travel_app';
void main() async {
  await Hive.initFlutter();
  await Hive.openBox<String>(travelBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: ColorPalette.primaryColor,
        scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
        backgroundColor: ColorPalette.backgroundScaffoldColor,
      ),
      debugShowCheckedModeBanner: false,
      routes: routes,
      home: const SplashScreen(),
    );
  }
}
