import 'package:dream_home/src/app.dart';
import 'package:dream_home/src/common/presentation/screens/home.dart';
import 'package:dream_home/src/common/presentation/screens/splash.dart';
import 'package:dream_home/src/common/presentation/screens/welcome.dart';
import 'package:dream_home/src/features/authentication/presentation/screens/login.dart';
import 'package:flutter/material.dart';

/// [GenerateRoutes] class is used to generate routes for the app.
class GenerateRoutes {
  static onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/welcome':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const WelcomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case '/home':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const HomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const DreamHome());
    }
  }
}
