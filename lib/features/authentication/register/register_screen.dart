import 'package:errandz/features/authentication/register/view_model/register_view_model.dart';
import 'package:errandz/features/widgets/custom_button.dart';
import 'package:errandz/res/dimension.dart';
import 'package:errandz/services/validation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../res/app_text.dart';
import '../../../res/style.dart';
import '../../widgets/account_footer_widget.dart';
import '../../widgets/app_title_heading.dart';
import '../../widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final registerViewModel = RegisterViewModel();
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
                AppText.letsGetStarted,
                style: AppTextStyle.monte20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(AppText.inputDetails, style: AppTextStyle.monte12),
              AppDimension.space37,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder(
                      valueListenable: registerViewModel.firstName,
                      builder: (context, value, child) {
                        return CustomTextField(
                          errorText: registerViewModel.firstNameTouch.value
                              ? ValidationService.validateFirstName(value)
                              : "",
                          width: 154.w,
                          keyboardType: TextInputType.name,
                          hintText: AppText.firstName,
                          prefixIcon: Icon(Icons.person),
                          onChanged: (value) {
                            registerViewModel.firstName.value = value;
                            registerViewModel.firstNameTouch.value = true;
                            setState(() {});
                          },
                        );
                      }),
                  ValueListenableBuilder(
                      valueListenable: registerViewModel.lastName,
                      builder: (context, value, child) {
                        return CustomTextField(
                          errorText: registerViewModel.lastNameTouch.value
                              ? ValidationService.validateLastName(value)
                              : "",
                          width: 154.w,
                          keyboardType: TextInputType.name,
                          hintText: AppText.lastName,
                          prefixIcon: Icon(Icons.person),
                          onChanged: (value) {
                            registerViewModel.lastName.value = value;
                            registerViewModel.lastNameTouch.value = true;
                            setState(() {});
                          },
                        );
                      }),
                ],
              ),
              AppDimension.space10,
              ValueListenableBuilder(
                  valueListenable: registerViewModel.phoneNumber,
                  builder: (context, value, child) {
                    return CustomTextField(
                      formatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        LengthLimitingTextInputFormatter(11)
                      ],
                      errorText: registerViewModel.phoneNumberTouch.value
                          ? ValidationService.validatePhoneNumber(value)
                          : "",
                      onChanged: (value) {
                        registerViewModel.phoneNumber.value = value;
                        registerViewModel.phoneNumberTouch.value = true;
                        setState(() {});
                      },
                      keyboardType: TextInputType.phone,
                      obscureText: false,
                      hintText: AppText.phoneNumber,
                      prefixIcon: Container(
                        width: 54.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                            color:
                                Theme.of(context).colorScheme.primaryContainer),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AppText.phoneCode,
                              style: TextStyle(fontSize: 8.sp),
                            ),
                            Icon(Icons.arrow_drop_down)
                          ],
                        ),
                      ),
                    );
                  }),
              ValueListenableBuilder(
                  valueListenable: registerViewModel.email,
                  builder: (context, value, child) {
                    return CustomTextField(
                      errorText: registerViewModel.emailTouch.value
                          ? ValidationService.validateEmail(value)
                          : "",
                      keyboardType: TextInputType.emailAddress,
                      hintText: AppText.email,
                      prefixIcon: Icon(Icons.email),
                      onChanged: (value) {
                        registerViewModel.email.value = value;
                        registerViewModel.emailTouch.value = true;
                        setState(() {});
                      },
                    );
                  }),
              ValueListenableBuilder(
                  valueListenable: registerViewModel.password,
                  builder: (context, value, child) {
                    return CustomTextField(
                      errorText: registerViewModel.passwordTouch.value
                          ? ValidationService.validatePassword(value)
                          : "",
                      keyboardType: TextInputType.visiblePassword,
                      hintText: AppText.password,
                      prefixIcon: Icon(Icons.lock_outline),
                      onChanged: (value) {
                        registerViewModel.password.value = value;
                        registerViewModel.passwordTouch.value = true;
                        setState(() {});
                      },
                    );
                  }),
              AppDimension.space30,
              ValueListenableBuilder(
                  valueListenable:
                      ValueNotifier<bool>(registerViewModel.isValid),
                  builder: (context, value, child) {
                    return CustomButton(
                        width: double.infinity,
                        text: AppText.continueWith,
                        onPressed: value ? () {
                          context.go('/otp-screen');
                        } : null);
                  }),
              AppDimension.space10,
              AccountFooterWidget(
                  mainText: AppText.alreadyHaveAnAccount,
                  buttonText: AppText.signIn,
                  onPressed: () {
                    context.go('/login');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
