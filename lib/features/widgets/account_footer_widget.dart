import 'package:errandz/res/style.dart';
import 'package:flutter/material.dart';

class AccountFooterWidget extends StatelessWidget {
  const AccountFooterWidget({
    super.key,
    required this.mainText,
    required this.buttonText,
    required this.onPressed,
    this.isOnboarding = false,
  });
  final String mainText;
  final String buttonText;
  final VoidCallback onPressed;
final bool isOnboarding;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          mainText,
          style: isOnboarding?AppTextStyle.monte14.copyWith(
            color: Colors.white
          ): AppTextStyle.monte14,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Theme.of(context).colorScheme.primary),
          ),
        )
      ],
    );
  }
}