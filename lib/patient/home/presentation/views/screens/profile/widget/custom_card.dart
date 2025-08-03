import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class customcart extends StatelessWidget {
  final String fullName;
  final String phone;
  final String email;
  final String birthDate;

  const customcart({
    super.key,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.birthDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLabel("الاسم كامل"),
            buildCard(fullName),
            buildLabel("رقم الجوال"),
            buildCard(phone),
            buildLabel("الإيميل"),
            buildCard(email),
            buildLabel("تاريخ الميلاد"),
            buildCard(birthDate),
          ],
        ),
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
    return SizedBox(
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
            style: TextStyle(fontSize: 16.sp, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
