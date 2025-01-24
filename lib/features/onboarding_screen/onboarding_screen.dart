import 'package:errandz/features/onboarding_screen/view_model/onboarding_viewmodel.dart';
import 'package:errandz/features/onboarding_screen/widgets/onboarding_slider.dart';
import 'package:errandz/features/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/app_title_heading.dart';
import '../widgets/account_footer_widget.dart';
import 'widgets/onboarding_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final viewModel = OnboardingViewModel();
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
            Colors.black.withValues(alpha: 0.6),
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
            AppTitleHeading(isOnboarding: true,),
            Spacer(),
            OnboardingSlider(viewModel: viewModel),
            OnboardingIndicator(viewModel: viewModel),
            SizedBox(
              height: 32,
            ),
            CustomButton(
              text: "Get Started",
              onPressed: () {},
              width: double.infinity,
            ),
            SizedBox(
              height: 20,
            ),
            AccountFooterWidget(
              isOnboarding: true,
              mainText: "Already have an account?",
              buttonText: "SIGN IN",
              onPressed: () {
                context.go('/login');
              },
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




