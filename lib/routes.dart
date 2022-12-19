import 'package:flutter/material.dart';
import 'package:new_app/representation/screens/guest_and_room_screen.dart';
import 'package:new_app/representation/screens/hotel_booking_screen.dart';
import 'package:new_app/representation/screens/intro_screen.dart';
import 'package:new_app/representation/screens/main_app.dart';
import 'package:new_app/representation/screens/select_date_screen.dart';
import 'package:new_app/representation/screens/slpash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelBookingScreen.routeName: (context) => const HotelBookingScreen(),
  SelectDateScreen.routeName: (context) => SelectDateScreen(),
  GuestAndRoomScreen.routeName: (context) => const GuestAndRoomScreen(),
};
