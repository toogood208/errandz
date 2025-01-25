import 'package:errandz/features/authentication/otp_screen/widget/change_email_sheet.dart';
import 'package:errandz/features/widgets/account_footer_widget.dart';
import 'package:errandz/features/widgets/app_title_heading.dart';
import 'package:errandz/features/widgets/custom_button.dart';
import 'package:errandz/features/widgets/custom_sheet.dart';
import 'package:errandz/res/app_text.dart';
import 'package:errandz/res/dimension.dart';
import 'package:errandz/res/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../widgets/custom_pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppDimension.appPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppDimension.space30,
              AppTitleHeading(),
              AppDimension.space41,
              SizedBox(
                width: 207.w,
                child: Text(
                  AppText.enterCodeText,
                  style: AppTextStyle.monte20
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              AppDimension.space6,
              SizedBox(
                width: 327.w,
                child: Text(
                  AppText.inputCodeText,
                  style: AppTextStyle.monte12,
                ),
              ),
              AppDimension.space6,
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () {
                  CustomSheet.bottomSheet(
                    height: 220.h,
                    context,
                    title: "Change Email",
                    child: ChangeEmailSheet(),
                  );
                },
                child: Text(
                  "Change Email",
                  style: AppTextStyle.monte12.copyWith(
                      fontWeight: FontWeight.w800,
                      decoration: TextDecoration.underline),
                ),

              ),
              AppDimension.space16,
              CustomPinPut(),
              AppDimension.space16,
              AccountFooterWidget(
                mainText: AppText.didNotGetCodeTexT,
                buttonText: AppText.resendCodeText,
                onPressed: () {},
              ),
              AppDimension.space32,
              CustomButton(
                  width: double.infinity,
                  text: AppText.verifyText,
                  onPressed: () {}),
              CustomPinPut()
            ],
          ),
        ),
      ),
    );
  }
}



