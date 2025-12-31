import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:think_forge_assesment/core/theme/app_colors.dart';

class AppTheme {
  // Colors
  static const Color primaryColor = Color(0xFF6C5DD3);
  static const Color secondaryColor = Color(0xFF1F2128);
  static const Color backgroundColor = Color(0xFF191B20);
  static const Color cardColor = Color(0xFF242731);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFFA7B1BC);
  static const Color successColor = Color(0xFF4CAF50);
  static const Color errorColor = Color(0xFFFF5252);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color dividerColor = Color(0xFF2A2D3A);

  // Text Styles
  static final TextStyle heading1 = GoogleFonts.inter(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: AppColors.background,
      brightness: Brightness.dark,
      fontFamily: 'Inter',
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.background,
          elevation: 0
      )
  );

  static final TextStyle heading2 = GoogleFonts.inter(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textPrimary,
  );

  static final TextStyle subtitle1 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textPrimary,
  );

  static final TextStyle subtitle2 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textSecondary,
  );

  static final TextStyle bodyText1 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textPrimary,
  );

  static final TextStyle bodyText2 = GoogleFonts.inter(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: textSecondary,
  );

  // Theme Data
  static ThemeData get darkThemes {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: backgroundColor,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: textPrimary),
        titleTextStyle: heading1.copyWith(fontSize: 20),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: subtitle1.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryColor,
          textStyle: subtitle1.copyWith(
            color: primaryColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: cardColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        hintStyle: bodyText1.copyWith(color: textSecondary),
        labelStyle: bodyText1.copyWith(color: textSecondary),
      ),
      dividerTheme: const DividerThemeData(
        color: dividerColor,
        thickness: 1,
        space: 1,
      ),
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: primaryColor,
        surface: cardColor,
        background: backgroundColor,
        error: errorColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: textPrimary,
        onBackground: textPrimary,
        onError: Colors.white,
        brightness: Brightness.dark,
      ),
    );
  }

  // Custom Widgets
  static Widget customCard({required Widget child, EdgeInsets? padding}) {
    return Container(
      padding: padding ?? const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }

  static Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: heading2,
      ),
    );
  }

}
