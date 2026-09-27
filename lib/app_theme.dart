import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Centralized app colors and spacing.
// Login, Sign-Up, and Home all use the same theme.

class AppColors {
  AppColors._();

  // Main colors
  static const Color navy = Color(0xFF17324D);
  static const Color lightBlue = Color(0xFF4A90E2);

  // Light colors
  static const Color paleBlue = Color(0xFFF1F7FC);
  static const Color iconBlue = Color(0xFFC7D9F2);

  // Backgrounds
  static const Color pageBackground = Color(0xFFF7F9FC);
  static const Color white = Colors.white;

  // Logout / danger
  static const Color red = Color(0xFFD9534F);

  // Text
  static const Color textDark = Color(0xFF17324D);
  static const Color textMuted = Color(0xFF687585);

  // Input borders
  static const Color inputBorder = Color(0xFFC8D6E5);
}

class AppSpacing {
  AppSpacing._();

  static const double screenPadding = 24;
  static const double fieldGap = 14;
  static const double cardRadius = 20;
  static const double fieldRadius = 12;
}

ThemeData buildAppTheme() {
  return ThemeData(
    useMaterial3: true,

    // Main page background
    scaffoldBackgroundColor: AppColors.pageBackground,

    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.navy,
      primary: AppColors.navy,
      secondary: AppColors.lightBlue,
      surface: AppColors.white,
    ),

    // App Bar
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.navy,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,

      titleTextStyle: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
      ),
    ),

    // Text
    textTheme: TextTheme(
      headlineSmall: GoogleFonts.poppins(
        fontWeight: FontWeight.w800,
        color: AppColors.textDark,
      ),

      bodyMedium: GoogleFonts.poppins(color: AppColors.textMuted, fontSize: 14),

      bodyLarge: GoogleFonts.poppins(color: AppColors.textDark),
    ),

    // Text fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.paleBlue,

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
        borderSide: const BorderSide(color: AppColors.inputBorder),
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
        borderSide: const BorderSide(color: AppColors.inputBorder),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
        borderSide: const BorderSide(color: AppColors.lightBlue, width: 1.6),
      ),

      labelStyle: GoogleFonts.poppins(color: AppColors.textMuted, fontSize: 14),

      hintStyle: GoogleFonts.poppins(color: AppColors.textMuted, fontSize: 14),
    ),

    // Login and Sign-Up buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightBlue,
        foregroundColor: Colors.white,
        minimumSize: const Size.fromHeight(48),
        elevation: 0,

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
        ),

        textStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w700,
          fontSize: 15,
          letterSpacing: 0.2,
        ),
      ),
    ),

    // Text links
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.navy,

        textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
    ),
  );
}

// Reusable card wrapper used by Login + Sign-Up.
class AuthCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final List<Widget> children;

  const AuthCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.screenPadding),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 12),

          // Soft blue icon circle
          CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.iconBlue,
            child: Icon(icon, color: AppColors.navy, size: 55),
          ),

          const SizedBox(height: 16),

          // Main heading
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          // Subtitle
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Main white card
          Container(
            padding: const EdgeInsets.all(20),

            decoration: BoxDecoration(
              color: AppColors.white,

              borderRadius: BorderRadius.circular(AppSpacing.cardRadius),

              border: Border.all(color: AppColors.inputBorder),

              boxShadow: [
                BoxShadow(
                  color: AppColors.navy.withValues(alpha: 0.08),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Column(children: children),
          ),
        ],
      ),
    );
  }
}
