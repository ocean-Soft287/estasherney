import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildMenuItem(IconData icon, String title, VoidCallback ontap) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 4),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.mainColor.withOpacity(0.3),
          width: 1.2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.mainColor,
            ),
            child: Icon(icon, color: AppColors.wightcolor),
          ),
          title: Text(
            title,
            style: GoogleFonts.leagueSpartan(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 18.sp,
            color: AppColors.mainColor,
          ),
          onTap: ontap,
        ),
      ),
    ),
  );
}
