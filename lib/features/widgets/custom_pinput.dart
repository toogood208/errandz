import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../res/style.dart';

class CustomPinPut extends StatelessWidget {
  const CustomPinPut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 6,
      defaultPinTheme: PinTheme(
        width: 48.w,
        height: 48.h,
        textStyle: AppTextStyle.monte24.copyWith(
          fontWeight: FontWeight.bold,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          border: Border.all(
              color:
              Theme.of(context).colorScheme.secondaryContainer),
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
    );
  }
}
