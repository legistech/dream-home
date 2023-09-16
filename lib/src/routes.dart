import 'package:dream_home/src/features/chatting/presentation/screens/create_chat.dart';
import 'package:dream_home/src/features/chatting/presentation/screens/messages.dart';
import 'package:dream_home/src/features/create_properties/presentation/screens/create_properties.dart';
import 'package:dream_home/src/features/emi_calculator/presentation/screens/emi_calculator.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'common/presentation/screens/home.dart';
import 'common/presentation/screens/splash.dart';
import 'common/presentation/screens/welcome.dart';
import 'features/authentication/presentation/screens/login.dart';
import 'features/authentication/presentation/screens/register.dart';
import 'features/featured_properties/presentation/screens/single_property.dart';
import 'features/featured_properties/presentation/screens/view_all.dart';

/// [GenerateRoutes] class is used to generate routes for the app.
/// To add a new route, add it to the switch statement in [onGenerateRoutes].
class GenerateRoutes {
  static onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const SplashScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case '/welcome':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const WelcomeScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
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
      case '/property-details':
        {
          final args = settings.arguments as Map<String, dynamic>;
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => SinglePropertyScreen(
              property: args['property'],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        }
      case '/view-all':
        {
          final args = settings.arguments as Map<String, dynamic>;
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ViewAllPropertiesScreen(
              properties: args['properties'],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        }
      case '/create-property':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const CreatePropertyScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case '/create-chat':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const CreateChatScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case '/emi-calculator':
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const EmiCalculator(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
      case '/messages':
        {
          final args = settings.arguments as Map<String, dynamic>;
          return PageRouteBuilder(
            pageBuilder: (_, __, ___) => MessagesScreen(
              chatId: args['chatId'],
              currentUser: args['currentUser'],
              nextUser: args['nextUser'],
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(opacity: animation, child: child);
            },
          );
        }
      default:
        return MaterialPageRoute(builder: (_) => const DreamHome());
    }
  }
}
