import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.notification_add,color: AppColors.greyColor,),
        leading: Text("En",style: GoogleFonts.leagueSpartan(color: AppColors.accentcolor,fontSize: 10.sp,fontWeight: FontWeight.w500),),
      ),
    );
  }
}