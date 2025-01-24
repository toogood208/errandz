import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    this.width,
    this.formatters,
  });

  final String? hintText;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Widget? suffix;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? errorText;
  final double? width;
  final List<TextInputFormatter>? formatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.h,
          width: width,
          child: TextField(
            inputFormatters: formatters,
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
                fontSize: 12.sp,
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
              color: Theme.of(context).colorScheme.error, fontSize: 10.sp),
        ),
      ],
    );
  }
}
