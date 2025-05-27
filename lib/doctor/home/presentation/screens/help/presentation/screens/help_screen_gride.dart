import 'package:consult_me/doctor/home/presentation/screens/help/presentation/screens/fqa_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GrideScreen extends StatelessWidget {
  const GrideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            'FAQs',
            style: GoogleFonts.leagueSpartan(
              color: Colors.white,
              fontSize: 20.sp,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("assets/images/Group 111.png"),
            ),
          ],

          leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.w,
            mainAxisSpacing: 10.h,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FAQScreen()),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/Group 111.png",
                        width: 40.w,
                        height: 40.h,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "الأسئلة الشائعة للمستخدمين",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Group 111.png",
                      width: 40.w,
                      height: 40.h,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "الأسئلة الشائعة للأطباء",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Group 111.png",
                      width: 40.w,
                      height: 40.h,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "طرق الدفع - الأسئلة الشائعة للمستخدمين",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/Group 111.png",
                      width: 40.w,
                      height: 40.h,
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "طرق الدفع - الأسئلة الشائعة للأطباء",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
