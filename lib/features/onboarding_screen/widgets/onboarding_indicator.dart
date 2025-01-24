import 'package:errandz/features/onboarding_screen/view_model/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';

import '../model/onboarding_model.dart';

class OnboardingIndicator extends StatelessWidget {
  const OnboardingIndicator({
    super.key,
    required this.viewModel,
  });
  final OnboardingViewModel viewModel;

  @override
  Widget build(BuildContext context) {

    return ValueListenableBuilder<int>(
        valueListenable: viewModel.selectedIndex ,
        builder: (context,value,child) {
          return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(onBoardingData.length, (index) {
                return Container(
                  margin: EdgeInsets.only(right: 4),
                  height: 4,
                  width: value == index ? 24: 12,
                  decoration: BoxDecoration(
                    color: value==index ?Colors.white:Colors.white.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(4),
                  ),
                );
              }).toList()

          );
        }
    );
  }
}