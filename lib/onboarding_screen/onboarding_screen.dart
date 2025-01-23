import 'package:errandz/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/onboarding2.jpg",
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withValues(alpha: 0.85),
            BlendMode.darken,
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              "Errandz",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              "We run your errands just with a few clicks",
              style: GoogleFonts.notoSans(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              "On-demand errand services,where ever or when ever the need arises",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 72,
            ),
            CustomButton(
              text: "Get Started",
              onPressed: () {},
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "SIGN IN",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationColor: Theme.of(context).colorScheme.primary),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 42,
            )
          ],
        ),
      ),
    );
  }
}
