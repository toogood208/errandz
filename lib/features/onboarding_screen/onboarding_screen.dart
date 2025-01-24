import 'package:errandz/features/onboarding_screen/view_model/onboarding_viewmodel.dart';
import 'package:errandz/features/onboarding_screen/widgets/onboarding_slider.dart';
import 'package:errandz/features/widgets/custom_button.dart';
import 'package:errandz/res/AppText.dart';
import 'package:errandz/res/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      padding: AppDimension.appPadding,
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
            AppDimension.space70,
            AppTitleHeading(isOnboarding: true,),
            Spacer(),
            OnboardingSlider(viewModel: viewModel),
            OnboardingIndicator(viewModel: viewModel),
            AppDimension.space32,
            CustomButton(
              text: AppText.getStarted,
              onPressed: () {
                context.go('/register');
              },
              width: double.infinity,
            ),
            AppDimension.space20,
            AccountFooterWidget(
              isOnboarding: true,
              mainText: AppText.alreadyHaveAnAccount,
              buttonText: AppText.signIn,
              onPressed: () {
                context.go('/login');
              },
            ),
            AppDimension.space42
          ],
        ),
      ),
    );
  }
}




