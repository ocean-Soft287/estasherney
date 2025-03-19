import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/Specializations.dart';
import 'package:consult_me/feature/home/presentation/views/widget/custom_grid_view.dart';
import 'package:consult_me/feature/home/presentation/views/widget/custom_vitamin_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "En",
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.accentcolor,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    Badge(
                      backgroundColor: AppColors.mainColor,
                      child: Icon(
                        Icons.notifications_outlined,
                        size: 20.r,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "مرحبًا في استشيرني، صحتك تهمنا!",
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ابحث عن طبيب...",
                    suffixIcon: Icon(Icons.search, color: Colors.grey, size: 30.sp),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الكل",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "فئات",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset("assets/images/Favorites.png"),
                      SizedBox(width: 10.w),
                      Image.asset("assets/images/Doctors.png"),
                      SizedBox(width: 10.w),
                      Image.asset("assets/images/Pharmacy.png"),
                      SizedBox(width: 10.w),
                      Image.asset("assets/images/Specialties.png"),
                      SizedBox(width: 10.w),
                      Image.asset("assets/images/Record.png"),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الكل",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "الجدول الزمني القادم",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/Group 19.png"),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                "الدكتور محمد فتحي",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                "طب أسنان",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.w),
                          Image.asset("assets/images/doctor.png"),
                        ],
                      ),
                      SizedBox(height: 20.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(Icons.message, color: Color(0xff96A7AF)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "الأحد 27 يونيو 2021",
                                style: GoogleFonts.leagueSpartan(
                                  color: Colors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "08:00 صباحًا - 10:00 صباحًا",
                                style: GoogleFonts.leagueSpartan(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Specializations()));
                      },
                      child: Text(
                        "الكل",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.accentcolor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      "التخصصات",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),

                SizedBox(
                  height: 250.h, 
                  child: CustomGridView(),),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الكل",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "الخدمات الطبيه",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                VitaminDTestCard()
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

