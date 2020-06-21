import 'package:flutter/src/material/theme_data.dart';
import 'package:mobile_healthcare/common/theme/theme_light.dart';

enum AppTheme { lightTheme }

final Map<AppTheme, ThemeData> appThemeData = {
  AppTheme.lightTheme: CustomTheme.buildTheme(),
};
