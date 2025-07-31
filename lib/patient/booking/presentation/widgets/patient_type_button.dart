import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PatientTypeButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;

  const PatientTypeButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 45.h,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(22.5.r),
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                color: isSelected ? AppColors.mainColor : Colors.transparent,
                borderRadius: BorderRadius.circular(22.5.r),
                border: Border.all(
                  color: AppColors.mainColor,
                  width: 2,
                ),
              ),
              child: Center(
                child: Text(
                  text,
                  style: GoogleFonts.leagueSpartan(
                    color: isSelected ? Colors.white : AppColors.mainColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
