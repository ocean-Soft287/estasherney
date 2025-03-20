import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDoctor extends StatelessWidget {
  const ProfileDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(  
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 30.h,
                  bottom: 10.h,
                  left: 20.w,
                  right: 20.w,
                ),
                width: double.infinity,
                height: 190.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade900, Colors.blue.shade500],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                ),
                child: Stack(
                  children: [
                      Positioned(
                        left: 5,
                        child: Image.asset("assets/images/Favorites-Blue.png")),
                   Positioned(
                  top: 0,
                  right: 120,
             
                  
                     child: Row(children: [
                     
                       SizedBox(width: 90.w,),
                       Image.asset("assets/images/Group 51.png"),
                       SizedBox(width: 4.w,),
                       Image.asset("assets/images/Group 50.png"),
                        SizedBox(width: 4.w,),
                       Image.asset("assets/images/Group 52.png"),
                         
                     ],),
                   ),
                   Positioned(
                    right: 5,
                    child: Icon(Icons.arrow_forward_ios_outlined,color: AppColors.wightcolor,)),
                    Positioned(
                      right: 20,
                      top: 30,
                      child: Image.asset('assets/images/doctor.png',height: 60,)),
                      Positioned(
                        top: 40,
                        right: 100,
                        child: Column(
                        children: [
                          Text("د/ محمد فتحي محمد ",style: GoogleFonts.leagueSpartan(color: AppColors.wightcolor,fontSize: 16.sp,fontWeight: FontWeight.w600),),
                           Text("جراحة الأمراض الجلدية",style: GoogleFonts.leagueSpartan(color: AppColors.wightcolor,fontSize: 14.sp,fontWeight: FontWeight.w400),),
                          SizedBox(height: 5,),
                           Row(
                            children: [
                             Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.star,size: 15,),
                                  SizedBox(width: 4,),
                                  Text("5")
                                ],
                              ),
                             ),
                             SizedBox(width: 10,),
                             Container(
                              width: 50,
                              height: 30,
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                borderRadius: BorderRadius.circular(16)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.chat,size: 15,),
                                  SizedBox(width: 4,),
                                  Text("40")
                                ],
                              ),
                             )
                            ],
                           )
                        ],
                      ))
                   
                  ],
                ),
          )]))));
  }
}