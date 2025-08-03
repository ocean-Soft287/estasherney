import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomPrice extends StatefulWidget {
  final LoginModel user;
  const CustomPrice({super.key, required this.user});

  @override
  State<CustomPrice> createState() => _CustomPriceState();
}

class _CustomPriceState extends State<CustomPrice> {
  String? examenPrice;
  @override
  void initState() {
    examenPrice = widget.user.examenPrice.toString();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "سعر الكشف",
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 160.w,
            height: 40.h,
            alignment: Alignment.topRight,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            color: Colors.grey[300],
            child: Text(
              examenPrice!,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
