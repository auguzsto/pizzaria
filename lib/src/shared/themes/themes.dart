import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pizzaria/src/shared/themes/colors/color_schemes.g.dart';

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
      textTheme: TextTheme(
        displayLarge: GoogleFonts.roboto(),
        displayMedium: GoogleFonts.roboto(),
        displaySmall: GoogleFonts.roboto(),
        titleLarge: GoogleFonts.roboto(),
        titleMedium: GoogleFonts.roboto(),
        titleSmall: GoogleFonts.roboto(),
        bodyLarge: GoogleFonts.roboto(),
        bodyMedium: GoogleFonts.roboto(),
        bodySmall: GoogleFonts.roboto(),
      ),
    );

ThemeData get darkColorTheme => ThemeData(
      useMaterial3: true,
      colorScheme: darkColorScheme,
    );
