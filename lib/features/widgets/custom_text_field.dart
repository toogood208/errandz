import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.onChanged,
    this.suffix,
    this.obscureText = false,
    this.keyboardType,
    this.errorText,
  });

  final String? hintText;
  final Icon? prefixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
          child: TextField(
            keyboardType: keyboardType,
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              suffix: suffix,
              isDense: true,
              filled: true,
              hintText: hintText,
              hintStyle: GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        Text(
          errorText ?? '',
          style: TextStyle(
              color: Theme.of(context).colorScheme.error, fontSize: 10),
        ),
      ],
    );
  }
}
