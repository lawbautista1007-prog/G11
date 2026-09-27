import 'package:flutter/material.dart';

import 'app_routes.dart';
import 'app_theme.dart';
import 'welcome-screen.dart';
import 'logIn-screen.dart';
import 'signup-screen.dart';
import 'home-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigation Demo',

      // Theme pulled from app_theme.dart so Login, Sign-Up, and Home
      // all share the same colors/fonts/button styles instead of
      // each screen looking different.
      theme: buildAppTheme(),

      // initialRoute telling the Navigator which named route to build first  when the app starts.
      initialRoute: AppRoutes.welcome,

      // routes maps each route name in approuts
      routes: {
        AppRoutes.welcome: (context) => const WelcomeScreen(),
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.signup: (context) => const SignUpScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}
