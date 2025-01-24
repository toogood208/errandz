import 'package:errandz/features/authentication/login/view_model/login_view_model.dart';
import 'package:errandz/features/widgets/account_footer_widget.dart';
import 'package:errandz/features/widgets/app_title_heading.dart';
import 'package:errandz/features/widgets/custom_button.dart';
import 'package:errandz/res/dimension.dart';
import 'package:errandz/res/style.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginViewModel = LoginViewModel();
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
                "Welcome",
                style: AppTextStyle.monte20.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Please input your details", style: AppTextStyle.monte12),
              AppDimension.space37,
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Email",
                prefixIcon: Icon(Icons.email_outlined),
                onChanged: (value) {
                  //loginViewModel.validateEmail(value);
                },
              ),
              AppDimension.space30,
              ValueListenableBuilder<bool>(
                  valueListenable: loginViewModel.obscure,
                  builder: (context, value, child) {
                    return CustomTextField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: value,
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock_outline),
                      suffix: TextButton(
                        onPressed: () {
                          loginViewModel.toggleObscure();
                        },
                        child: Text(
                         value? "Show":"Hide",
                          style: AppTextStyle.monte12
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                      ),
                    );
                  }),
              AppDimension.space10,
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
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
                      text: "Login",
                      onPressed: value ? () {} : null,
                    );
                  }),
              AppDimension.space28,
              AccountFooterWidget(
                  mainText: "Need an account?",
                  buttonText: "SIGN UP",
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}
