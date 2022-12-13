import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/core/constants/color_palatte.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  static const routeName = '/main_app';

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: const Text('Main App'),
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        selectedItemColor: ColorPalette.primaryColor,
        unselectedItemColor: ColorPalette.primaryColor.withOpacity(0.3),
        margin: const EdgeInsets.symmetric(
          horizontal: kMediumPadding,
          vertical: kDefaultPadding,
        ),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.house,
              size: kDefaultIconSize,
            ),
            title: const Text("Home"),
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidHeart,
              size: kDefaultIconSize,
            ),
            title: const Text("Likes"),
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.briefcase,
              size: kDefaultIconSize,
            ),
            title: const Text("Booking"),
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(
              FontAwesomeIcons.solidUser,
              size: kDefaultIconSize,
            ),
            title: const Text("Profile"),
          ),
        ],
      ),
    );
  }
}
