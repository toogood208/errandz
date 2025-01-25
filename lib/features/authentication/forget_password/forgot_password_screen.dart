import 'package:errandz/features/widgets/custom_sheet.dart';
import 'package:errandz/res/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/app_text.dart';
import '../../../res/style.dart';
import '../../widgets/app_title_heading.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_pinput.dart';
import '../../widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
              Text(
                AppText.forgotPassword,
                style: AppTextStyle.monte20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(AppText.inputDetails, style: AppTextStyle.monte12),
              AppDimension.space37,
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: AppText.email,
                prefixIcon: Icon(Icons.email_outlined),
                onChanged: (value) {
                  setState(() {});
                },
              ),
              AppDimension.space16,
              CustomButton(
                width: double.infinity,
                text: AppText.login,
                onPressed: () {
                  CustomSheet.bottomSheet(
                    context,
                    title: AppText.resetPassword,
                    height: 360.h,
                    child: Column(
                      children: [
                        CustomTextField(
                          prefixIcon: Icon(Icons.lock),
                          hintText: AppText.newPassword,
                        ),
                        CustomTextField(
                          prefixIcon: Icon(Icons.lock),
                          hintText:  AppText.confirmPassword,
                        ),
                        Text(AppText.inputPin, style: AppTextStyle.monte20.copyWith(
                          fontWeight: FontWeight.bold
                        ),),
                        AppDimension.space16,
                        CustomPinPut(),
                        AppDimension.space20,
                        CustomButton(
                          width: double.infinity,
                            text: AppText.reset, onPressed: (){})

                      ],
                    ),
                  );
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
