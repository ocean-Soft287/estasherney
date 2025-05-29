import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? hintText;
  final Widget? prefix;
  final Widget? subfix;
  final Color textcolor;

  final dynamic obscureText;
  final FormFieldValidator<String>? validator;
  final Color fillColor;
  final Color borderColor;
  final double paddingN;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.textcolor = AppColors.mainColor,
    this.textInputType = TextInputType.text,
    this.hintText,
    this.prefix,
    this.validator,
    this.subfix,
    this.obscureText,
    this.fillColor = const Color(0xffEEEEEE),
    this.borderColor = const Color(0xff131874),
    this.paddingN = 8,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.paddingN),
      child: TextFormField(
        style: GoogleFonts.alexandria(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
        ),
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.subfix,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),

          hintText: widget.hintText,
          hintStyle: GoogleFonts.alexandria(
            color: widget.textcolor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
          fillColor: widget.fillColor,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0.0,
            horizontal: 12.0,
          ),
          prefixIcon: widget.prefix,
        ),
        keyboardType: widget.textInputType,
        validator: widget.validator,

        obscureText: widget.obscureText == null ? false : widget.obscureText,
      ),
    );
  }
}
