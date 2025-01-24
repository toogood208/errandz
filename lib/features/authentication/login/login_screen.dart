import 'package:errandz/features/authentication/login/view_model/login_view_model.dart';
import 'package:errandz/features/widgets/account_footer_widget.dart';
import 'package:errandz/features/widgets/app_title_heading.dart';
import 'package:errandz/features/widgets/custom_button.dart';
import 'package:errandz/res/AppText.dart';
import 'package:errandz/res/dimension.dart';
import 'package:errandz/res/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginViewModel = LoginViewModel();
  @override
  void dispose() {
    loginViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
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
                AppText.welcome,
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
                  loginViewModel.email.value = value;
                  setState(() {});
                },
              ),
              AppDimension.space10,
              ValueListenableBuilder<bool>(
                  valueListenable: loginViewModel.obscure,
                  builder: (context, value, child) {
                    return CustomTextField(
                      onChanged: (value) {
                        loginViewModel.password.value = value;
                        setState(() {});
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: value,
                      hintText: AppText.password,
                      prefixIcon: Icon(Icons.lock_outline),
                      suffix: TextButton(
                        onPressed: () {
                          loginViewModel.toggleObscure();
                        },
                        child: Text(
                          value ? AppText.show : AppText.hide,
                          style: AppTextStyle.monte12
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }),
              //AppDimension.space5,
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    AppText.forgotPassword,
                    style: AppTextStyle.monte12.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? Colors.white.withValues(alpha: 0.7)
                            : Colors.black),
                  ),
                ),
              ),
              AppDimension.space30,
              ValueListenableBuilder<bool>(
                  valueListenable: ValueNotifier<bool>(loginViewModel.isValid),
                  builder: (context, value, child) {
                    return CustomButton(
                      width: double.infinity,
                      text: AppText.login,
                      onPressed: value
                          ? () {
                              if (value) {}
                            }
                          : null,
                    );
                  }),
              AppDimension.space10,
              AccountFooterWidget(
                  mainText: AppText.needAccount,
                  buttonText: AppText.signUp,
                  onPressed: () {
                    context.go('/register');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
