
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constant/app_constant.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Color(AppConstant.primaryColor),
    colorScheme: ColorScheme.light(),
  );
}