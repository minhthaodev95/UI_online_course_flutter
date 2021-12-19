import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/ui/account_screen.dart';
import 'package:online_learning_huweii/src/ui/course_detail_screen.dart';
import 'package:online_learning_huweii/src/ui/course_screen.dart';
import 'package:online_learning_huweii/src/ui/login.dart';
import 'package:online_learning_huweii/src/ui/message_screen.dart';
import 'package:online_learning_huweii/src/ui/onboarding.dart';
import 'package:online_learning_huweii/src/ui/main_screen.dart';
import 'package:online_learning_huweii/src/ui/search_screen.dart';
import 'package:online_learning_huweii/src/ui/signup.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(MainScreen());
      case '/MainScreen':
        if (settings.arguments != null) {
          final args = settings.arguments as Map;
          return _materialRoute(
              MainScreen(selectedIndex: args['selectedIndex']));
        } else {
          return _materialRoute(MainScreen());
        }
      case '/CourseDetail':
        if (settings.arguments != null) {
          final args = settings.arguments as Map;
          return _materialRoute(CourseDetail(idCourse: args['idCourse']));
        }
        break;
      case '/SignUp':
        return _materialRoute(const SignUp());
      case '/LogIn':
        return _materialRoute(const LogIn());
      case '/CourseScreen':
        return _materialRoute(const CourseScreen());
      case '/SearchScreen':
        return _materialRoute(const SearchScreen());
      case '/MessageScreen':
        return _materialRoute(const MessageScreen());
      case '/ProfileScreen':
        return _materialRoute(const ProfileScreen());
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
