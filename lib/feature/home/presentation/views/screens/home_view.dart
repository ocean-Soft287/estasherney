import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 12,right: 12,top: 10),
        child: Scaffold(
          body: Column(
            children: [
              Row(
                children: [
                  Text(
                    "En",
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accentcolor
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Badge(
                    child: Icon(Icons.notification_important_outlined,size: 20.r,),
                  ),
                  SizedBox(width: 90.w),
                  
                  Text("مرحبًا في استشيرني، صحتك تهمنا!",style: GoogleFonts.leagueSpartan(fontSize: 15.sp,fontWeight: FontWeight.w500 ),
                  textAlign: TextAlign.right,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
