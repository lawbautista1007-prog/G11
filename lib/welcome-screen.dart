import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_routes.dart';
import 'app_theme.dart';

// Opening / landing page.
// Shows the app name and two buttons that lead to Login and Sign-Up.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screenPadding),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App icon
              CircleAvatar(
                radius: 45,
                backgroundColor: AppColors.iconBlue,
                child: const Icon(
                  Icons.rocket_launch_outlined,
                  color: AppColors.navy,
                  size: 60,
                ),
              ),

              const SizedBox(height: 20),

              // App name
              Text(
                'g11',
                style: GoogleFonts.poppins(
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: AppColors.navy,
                  letterSpacing: 1,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                'Welcome! Please log in or create an account.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),

              const SizedBox(height: 40),

              // Log In button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.login);
                },
                child: const Text('Log In'),
              ),

              const SizedBox(height: 14),

              // Sign Up button (outlined so it reads as the secondary action)
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                  side: const BorderSide(color: AppColors.lightBlue, width: 1.6),
                  foregroundColor: AppColors.navy,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppSpacing.fieldRadius),
                  ),
                  textStyle: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    letterSpacing: 0.2,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.signup);
                },
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
