import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBackground extends StatelessWidget {
  const CustomBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      width: double.infinity,
      height: 180.h,
      decoration: BoxDecoration(
        gradient: AppColors.blueGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Text(
                'مركز المساعدة',
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "LeagueSpartan",
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(1.w, 1.h),
                      blurRadius: 2.r,
                    ),
                  ],
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                '  كيف يمكننا مساعدتك؟',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: "LeagueSpartan",
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(1.w, 1.h),
                      blurRadius: 2.r,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              TextFormField(
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: "ابحث......",
                  hintStyle: TextStyle(color: Colors.grey),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Icon(Icons.search, color: Colors.grey),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 20.w,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 0.w,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 20.sp,
            ),
          ),
        ],
      ),
    );
  }
}
