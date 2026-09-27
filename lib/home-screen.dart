import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_routes.dart';
import 'app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Reading the name passed from Sign-Up via route arguments
    final args = ModalRoute.of(context)!.settings.arguments as Map?;

    final String name =
        args != null && (args['name'] ?? '').toString().isNotEmpty
        ? args['name'].toString()
        : 'User';

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Home',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Container(height: 3, color: AppColors.lightBlue),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // User profile icon
              CircleAvatar(
                radius: 40,
                backgroundColor: AppColors.iconBlue,

                child: Text(
                  name.isNotEmpty ? name[0].toUpperCase() : 'U',

                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: AppColors.navy,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // Welcome message
              Text(
                'Welcome, $name!',

                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppColors.textDark,
                ),

                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 6),

              // Login status
              Text(
                "You're logged in.",

                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: AppColors.textMuted,
                  fontWeight: FontWeight.w400,
                ),
              ),

              const SizedBox(height: 32),

              // Logout
              // Clears the navigation stack so the user
              // cannot go back to Home after logging out.
              SizedBox(
                width: 200,

                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.login,
                      (route) => false,
                    );
                  },

                  icon: const Icon(Icons.logout),

                  label: Text(
                    'Logout',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  // Red specifically for Logout
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
