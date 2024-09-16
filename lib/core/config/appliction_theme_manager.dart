import 'package:flutter/material.dart';

import '../colors_palette.dart';

class ApplictionThemeManager {
  static ThemeData themeData = ThemeData(
      primaryColor: ColorsPalette.primaryColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorsPalette.primaryColor,
        titleTextStyle: TextStyle(
          fontFamily: "Exo",
          fontSize: 22,
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(35),
          bottomRight: Radius.circular(35),
        )),
        iconTheme: IconThemeData(
          size: 35,
          color: Colors.white,
        ),
      ));
}
