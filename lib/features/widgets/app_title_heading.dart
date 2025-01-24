import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTitleHeading extends StatelessWidget {
  const AppTitleHeading({
    super.key,
    this.isOnboarding = false,
  });
  final bool isOnboarding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Erra",
            style: GoogleFonts.baloo2(
                color: !isOnboarding?Theme.of(context).colorScheme.primary:  Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
        Text("nds",
            style: GoogleFonts.baloo2(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ],
    );
  }
}