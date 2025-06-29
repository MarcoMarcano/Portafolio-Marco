import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/about_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/hobbies_screen.dart';
import '../screens/profile_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => HomeScreen(),
    '/about': (context) => AboutScreen(),
    '/contact': (context) => ContactScreen(),
    '/hobbies': (context) => HobbiesScreen(),
    '/profile': (context) => ProfileScreen(),
  };
}
