import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
class HeaderContainer extends StatelessWidget {
  final String title;
  const HeaderContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: AppColors.blueGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),
        ),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);

            },
          ),
          Expanded(
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  fontFamily: Appfonts.font,
                ),
              ),
            ),
          ),
          SizedBox(width: 48), // نفس عرض أيقونة الرجوع لضمان التماثل
        ],
      ),
    );
  }
}
