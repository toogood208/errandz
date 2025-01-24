import 'package:flutter/material.dart';

class OnboardingViewModel {
  final ValueNotifier<int> selectedIndex = ValueNotifier<int>(0);

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
