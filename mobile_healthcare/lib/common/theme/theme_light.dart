import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_healthcare/common/styles/colors.dart';
import 'package:mobile_healthcare/common/styles/dimens.dart';

class CustomTheme {
  static ThemeData buildTheme() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
    );

    return ThemeData(
      bottomAppBarTheme: BottomAppBarTheme(
        color: CustomColors.cardColor,
        elevation: 2,
      ),
      appBarTheme:
          AppBarTheme(color: CustomColors.backgroundAppBarColor, elevation: 1),
      backgroundColor: CustomColors.backgroundColor,
      accentColor: CustomColors.accentColor,
      primaryColor: CustomColors.primaryColor,
      cardTheme: CardTheme(
          color: CustomColors.cardColor, elevation: Dimens.cardElevation),
      textSelectionColor: const Color.fromARGB(255, 105, 113, 141),
      selectedRowColor: CustomColors.bottomNavigationSelectedButtonColor,
      errorColor: Colors.red[600],
      buttonColor: const Color.fromRGBO(50, 205, 50, 1),
      primaryIconTheme: IconThemeData(
        color: Colors.black45,
      ),
      highlightColor: Colors.black87,
      textTheme: TextTheme(
        //Title card, title content
        //Title
        headline6: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        //Subtitle
        subtitle2: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        //Subhead
        subtitle1: const TextStyle(
          color: Color.fromARGB(255, 105, 113, 141),
          fontWeight: FontWeight.normal,
          fontSize: 15,
        ),
        //Headline
        headline5: const TextStyle(
          color: Color.fromRGBO(0, 0, 0, 1),
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        //Display2
        headline3: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 43,
        ),
        //Default text, content
        //Body1
        bodyText2: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Color.fromRGBO(110, 118, 136, 1),
        ),
        //Body2
        bodyText1: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: CustomColors.primaryColor,
        ),
        //Section title text
        //Overline
        overline: const TextStyle(
          color: Color.fromRGBO(110, 118, 136, 1),
          fontSize: 12,
        ),
        //Caption
        caption: TextStyle(
          color: Colors.black87,
          fontSize: 12,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color.fromRGBO(0, 0, 0, 0.7),
      ),
      cardColor: const Color.fromRGBO(255, 255, 255, 1),
    );
  }
}
