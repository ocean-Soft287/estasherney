

  import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildInfoCards() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildLabel("الاسم كامل"),
          buildCard("محمد فتحي"),
          buildLabel("رقم الجوال"),
          buildCard("+123 567 89000"),
          buildLabel("الإيميل"),
          buildCard("mohamedfathy12@gmail.com"),
          buildLabel("تاريخ الميلاد"),
          buildCard("DD / MM / YYYY"),
        ],
      ),
    );
  }

  Widget buildLabel(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        text,
        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget buildCard(String text) {
    return Container(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 2,
        color: AppColors.wightcolor,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          child: Text(
            text,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey),
          ),
        ),
      ),
    );
  }

