import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final String text;
  final double borderRadius;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.height = 56.0,
    this.width = 327.0,
    this.color,
    required this.text,
    this.borderRadius = 10.0,
    this.textStyle,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ?? TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}
