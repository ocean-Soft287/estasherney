import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/custom_notfication_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Notfication extends StatelessWidget {
  const Notfication({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 80.h,
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
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "الإشعارات",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 48.w),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "ابحث...",
                        prefixIcon: Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "اليوم",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),

            Expanded(
              child: ListView(
                padding: EdgeInsets.all(10),
                children: [
                  NotificationItem(
                    title: "الموعد المقرر",
                    time: "2M",
                    description:
                        "موعدك مقرر مع الطبيب في التاريخ والوقت المحددين. يُرجى الحضور في الوقت المناسب واتباع أي تعليمات ",
                  ),
                  NotificationItem(
                    title: "تغيير الموعد",
                    time: "2M",
                    description:
                        "موعدك مقرر مع الطبيب في التاريخ والوقت المحددين. يُرجى الحضور في الوقت المناسب واتباع أي تعليمات ",
                  ),
                  NotificationItem(
                    time: "2M",
                    title: "الموعد المقرر",
                    description:
                        "موعدك مقرر مع الطبيب في التاريخ والوقت المحددين. يُرجى الحضور في الوقت المناسب واتباع أي تعليمات ",
                  ),

                  
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Chip(
                        side: BorderSide(color: AppColors.mainColor),
                        label: Text(
                          "الثلاثاء",
                          style: GoogleFonts.leagueSpartan(fontSize: 14.sp,color: Color(0xff252525)),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),

                  NotificationItem(
                    time: "2M",
                    title: "الموعد المقرر",
                    description:
                        "موعدك مقرر مع الطبيب في التاريخ والوقت المحددين. يُرجى الحضور في الوقت المناسب واتباع أي تعليمات ",
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 15.h,horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Chip(
                        side: BorderSide(color: AppColors.mainColor),
                        label: Text(
                          "15 إبريل",
                          style: GoogleFonts.leagueSpartan(fontSize: 14.sp,color: Color(0xff252525)),
                        ),
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),

                  NotificationItem(
                    title: "الموعد المقرر",
                    time: "2M",
                    description:
                        "موعدك مقرر مع الطبيب في التاريخ والوقت المحددين. يُرجى الحضور في الوقت المناسب واتباع أي تعليمات ",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
