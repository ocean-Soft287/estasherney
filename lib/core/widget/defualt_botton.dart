

import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final Function function;
  final Color backgroundColor;
  final Color textColor;
  final bool hasIcon;
  final Widget? icon;
  final double heightButton;
  final bool isborder;
  const DefaultButton({
    super.key,
    required this.text,
    required this.function,
    this.backgroundColor =AppColors.mainColor ,
    this.textColor = Colors.white,
    this.hasIcon = false,
    this.isborder=false,
    this.icon,
    this.heightButton=45,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:(!isborder)? backgroundColor:textColor,
        borderRadius: BorderRadius.circular(8.0.r),
        border: (!isborder)?Border.all(
          color: backgroundColor
        ):Border.all()
      ),
      width: double.infinity,
      height: heightButton.h,
      child: GestureDetector(
        onTap:() {
          function();
        },

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon && icon != null) icon!,
            const SizedBox(width: 10,),
            Text(
              text,
              style: GoogleFonts.alexandria(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color:(!isborder)? textColor:backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}