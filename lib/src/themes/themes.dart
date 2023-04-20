import 'package:flutter/material.dart';
import 'package:pizzaria/src/themes/colors/color_schemes.g.dart';

ThemeData get lightColorTheme => ThemeData(
      useMaterial3: true,
      colorScheme: lightColorScheme,
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.error,
        foregroundColor: lightColorScheme.onTertiary,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: lightColorScheme.onTertiary,
        unselectedLabelColor: lightColorScheme.primaryContainer,
        indicatorColor: lightColorScheme.onTertiary,
        overlayColor: MaterialStateColor.resolveWith(
          (states) => lightColorScheme.error,
        ),
      ),
    );

ThemeData get darkColorTheme => ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
    );
