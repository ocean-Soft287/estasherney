// ✅ مكون زر التبديل
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';

class CustomToggleButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomToggleButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: .4 * MediaQuery.sizeOf(context).width,
        height: 40.h,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mainColor : AppColors.wightcolor,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: AppColors.mainColor, width: 1),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w800,
            fontFamily: Appfonts.font,
            color: isSelected ? AppColors.wightcolor : AppColors.mainColor,
          ),
        ),
      ),
    );
  }
}