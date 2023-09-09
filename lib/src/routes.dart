import 'package:dream_home/src/app.dart';
import 'package:dream_home/src/common/presentation/screens/home.dart';
import 'package:dream_home/src/common/presentation/screens/splash.dart';
import 'package:dream_home/src/common/presentation/screens/welcome.dart';
import 'package:dream_home/src/features/authentication/presentation/screens/login.dart';
import 'package:dream_home/src/features/authentication/presentation/screens/register.dart';
import 'package:flutter/material.dart';

/// [GenerateRoutes] class is used to generate routes for the app.
/// To add a new route, add it to the switch statement in [onGenerateRoutes].
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
        {
          final args = settings.arguments as Map<String, dynamic>;
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => HomeScreen(
              properties: args['properties'],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        }
      case '/register':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const RegisterScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case '/login':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );

      default:
        return MaterialPageRoute(builder: (_) => const DreamHome());
    }
  }
}
