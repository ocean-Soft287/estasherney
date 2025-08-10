import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/constants/app_fonts.dart';
import 'package:consult_me/core/services/check_tablet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final Color backgroundColor;
  final Color textColor;
  final bool hasIcon;
  final Widget? icon;
  final double? heightButton;
  final bool isborder;
  final double? width;
  final double? radius;
  const DefaultButton({
    super.key,
    required this.text,
    required this.function,
    this.backgroundColor = AppColors.mainColor,
    this.textColor = Colors.white,
    this.hasIcon = false,
    this.isborder = false,
    this.icon,
    this.heightButton,
    this.width,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: (!isborder) ? backgroundColor : textColor,
        borderRadius: BorderRadius.circular(radius ?? 18.0.r),
        border: (!isborder) ? Border.all(color: backgroundColor) : Border.all(),
      ),
      width: width ?? 0.5 * MediaQuery.sizeOf(context).width,
      height: heightButton ?? 45.h,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: function,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (hasIcon && icon != null) icon!,
            const SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: isTablet(context)? 12.sp : 16.sp,
                fontFamily: Appfonts.font,
                fontWeight: FontWeight.w400,
                color: (!isborder) ? textColor : backgroundColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
