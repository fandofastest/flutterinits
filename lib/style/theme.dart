import 'package:flutter/material.dart';
import 'package:music55/style/mystyle.dart';

import '../generated/assets.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    fontFamily: Assets.fontsRobotoregular,
    canvasColor: FigmaColors.lightBackgroundlight,
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: FigmaColors.lightsurfacevariantlight,
      elevation: 0,
      selectedItemColor: FigmaColors.lightOnbackgroundlight,
      unselectedItemColor: FigmaColors.grey,

    ),
    primaryColor: FigmaColors.lightSurfacelight,
    appBarTheme: const AppBarTheme(
      backgroundColor: FigmaColors.lightsurfacevariantlight,
      elevation: 0,
      iconTheme: IconThemeData(
        color: FigmaColors.lightOnbackgroundlight,
      ),
    ),
    useMaterial3: false,
        colorScheme:  const ColorScheme.light(
          primary: FigmaColors.lightOnbackgroundlight,
          secondary: FigmaColors.lightOnbackgroundlight,
          surface: FigmaColors.lightOnbackgroundlight,
          shadow: FigmaColors.primary,
        ),

        iconButtonTheme:  IconButtonThemeData(
          style: ButtonStyle(
            iconColor: MaterialStateProperty.all<Color>(
              FigmaColors.lightOnbackgroundlight,
            ),
          ),
        ),

        brightness: Brightness.light,
        textTheme: TextTheme(
          titleLarge: FigmaTextStyles()
              .tittlelarge
              .copyWith(color: FigmaColors.textlight),
          titleMedium: FigmaTextStyles()
              .tittlemedium
              .copyWith(color: FigmaColors.textlight),
          titleSmall: FigmaTextStyles()
              .tittlesmall
              .copyWith(color: FigmaColors.textlight),
          bodyLarge: FigmaTextStyles()
              .bodylarge
              .copyWith(color: FigmaColors.textlight),
          bodyMedium: FigmaTextStyles()
              .bodymedium
              .copyWith(color: FigmaColors.textlight),
          bodySmall: FigmaTextStyles()
              .bodysmall
              .copyWith(color: FigmaColors.textlight),
          labelMedium: FigmaTextStyles()
              .labelmedium
              .copyWith(color: FigmaColors.textlight),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      fontFamily: Assets.fontsRobotoregular,
      secondaryHeaderColor: FigmaColors.darkSurfacevariantdark,
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: FigmaColors.darkBackgrounddark,
        elevation: 0,
        selectedItemColor: FigmaColors.darkOnbackgrounddark,
        unselectedItemColor: FigmaColors.grey,
      ),
    appBarTheme: const AppBarTheme(
      backgroundColor: FigmaColors.darkSurfacevariantdark,
      elevation: 0,
      iconTheme: IconThemeData(
        color: FigmaColors.lightOnbackgroundlight,
      ),
    ),
      brightness: Brightness.dark,
      primaryColor: FigmaColors.darkSurfacevariantdark,
      canvasColor: FigmaColors.darkBackgrounddark,
      colorScheme:  const ColorScheme.dark(
        primary: FigmaColors.darkSurfacevariantdark,
        secondary: FigmaColors.darkSurfacedark,
        surface: FigmaColors.darkBackgrounddark,
        shadow: FigmaColors.primary,
        background: FigmaColors.darkBackgrounddark,
      ),
      iconButtonTheme:  IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(
            FigmaColors.lightOnbackgroundlight,
          ),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: const FigmaTextStyles()
            .tittlelarge
            .copyWith(color: FigmaColors.textdark),
        titleMedium: const FigmaTextStyles()
            .tittlemedium
            .copyWith(color: FigmaColors.textdark),
        titleSmall: const FigmaTextStyles()
            .tittlesmall
            .copyWith(color: FigmaColors.textdark),
        bodyLarge: const FigmaTextStyles()
            .bodylarge
            .copyWith(color: FigmaColors.textdark),
        bodyMedium: const FigmaTextStyles()
            .bodymedium
            .copyWith(color: FigmaColors.textdark),
        bodySmall: FigmaTextStyles()
            .bodysmall
            .copyWith(color: FigmaColors.textdark),
        labelMedium: FigmaTextStyles()
            .labelmedium
            .copyWith(color: FigmaColors.textdark),
      ));
}
