import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../model/onboarding_model.dart';
import '../view_model/onboarding_viewmodel.dart';

class OnboardingSlider extends StatefulWidget {
  const OnboardingSlider({
    super.key,
    required this.viewModel
  });
  final OnboardingViewModel viewModel;

  @override
  State<OnboardingSlider> createState() => _OnboardingSliderState();
}

class _OnboardingSliderState extends State<OnboardingSlider> {
  late PageController _pageController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      if (_pageController.page == onBoardingData.length - 1) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.easeIn);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: PageView.builder(
          controller: _pageController,
        onPageChanged:widget.viewModel.updateIndex,
          itemCount: onBoardingData.length,
          itemBuilder: (context,index) {
            final data = onBoardingData[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 280,
                  child: Text(
                    data.title,
                    style: GoogleFonts.baloo2(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  data.description,
                  style: GoogleFonts.montserrat(color: Colors.white),
                ),
              ],
            );

          }),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }
}