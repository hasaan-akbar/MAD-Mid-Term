import 'package:flutter/material.dart';

import '../screens/about_screen.dart';
import '../screens/events_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/registration_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String events = '/events';
  static const String registration = '/registration';
  static const String profile = '/profile';
  static const String about = '/about';

  /// Order matches the items of the BottomNavigationBar.
  static const List<String> bottomNavRoutes = [home, events, profile];

  static final Map<String, WidgetBuilder> routes = {
    home: (context) => const HomeScreen(),
    events: (context) => const EventsScreen(),
    registration: (context) => const RegistrationScreen(),
    profile: (context) => const ProfileScreen(),
    about: (context) => const AboutScreen(),
  };

  /// Used by the BottomNavigationBar and the Drawer for the three main
  /// destinations. Home always stays at the bottom of the stack, so Android
  /// Back from Events or Profile returns to Home.
  static void goToMain(BuildContext context, String route) {
    if (route == home) {
      Navigator.pushNamedAndRemoveUntil(context, home, (r) => false);
    } else {
      Navigator.pushNamedAndRemoveUntil(
        context,
        route,
        (r) => r.settings.name == home,
      );
    }
  }
}
