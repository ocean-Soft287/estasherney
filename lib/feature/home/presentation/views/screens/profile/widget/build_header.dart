import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildHeader({required BuildContext context, String? imageUrl}) {
  return Container(
    padding: EdgeInsets.only(top: 10.h),
    height: 190.h,
    width: double.infinity,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: AppColors.blueGradient,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
    child: Stack(
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              Text(
                "الملف الشخصي",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20.h),
              Stack(
                clipBehavior: Clip.none,
                children: [
                 CircleAvatar(
  radius: 45.r,
  backgroundImage: (imageUrl != null && imageUrl!.isNotEmpty)
      ? NetworkImage(imageUrl!)
      : const AssetImage("assets/images/doctor.png") as ImageProvider,
),

                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 25.h,
          right: 15.w,
          child: Image.asset("assets/images/Settigns.png"),
        ),
        Positioned(
          top: 10.h,
          left: 10.w,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    ),
  );
}
