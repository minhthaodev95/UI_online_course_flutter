import 'package:flutter/material.dart';
import 'package:online_learning_huweii/src/configs/theme/colors.dart';

class AppTheme {
  static const colors = AppColors();
  // const AppTheme._();
  static ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
          elevation: 0,
          color: colors.white,
          titleTextStyle: TextStyle(color: colors.text1)),
      scaffoldBackgroundColor: colors.white,
      splashColor: Colors.transparent,
      fontFamily: 'Poppins',
      primaryColor: colors.primaryColor,
    );
  }
}
