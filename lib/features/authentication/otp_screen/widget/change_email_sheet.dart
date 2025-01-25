import 'package:errandz/features/widgets/custom_button.dart';
import 'package:errandz/features/widgets/custom_text_field.dart';
import 'package:errandz/res/dimension.dart';
import 'package:flutter/material.dart';

class ChangeEmailSheet extends StatelessWidget {
  const ChangeEmailSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hintText: "Email",
        ),
        AppDimension.space20,
        CustomButton(
          width: double.infinity,
          text: "Change",
          onPressed: () {},
        )
      ],
    );
  }
}
