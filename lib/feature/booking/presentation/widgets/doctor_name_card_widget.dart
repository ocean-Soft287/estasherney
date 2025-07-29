import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorNameCard extends StatelessWidget {
  final String doctorName;

  const DoctorNameCard({super.key, required this.doctorName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Text(
        'Dr. $doctorName',
        style: GoogleFonts.leagueSpartan(
          fontSize: 14.sp,
          color: AppColors.mainColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
