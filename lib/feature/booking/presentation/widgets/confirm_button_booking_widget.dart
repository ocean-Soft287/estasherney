import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ConfirmButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;

  const ConfirmButtonWidget({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      width: double.infinity,
      height: 55.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(27.5.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(27.5.r),
        child: InkWell(
          borderRadius: BorderRadius.circular(27.5.r),
          onTap: onPressed,
          child: Center(
            child: Text(
              "تأكيد الحجز",
              style: GoogleFonts.leagueSpartan(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
