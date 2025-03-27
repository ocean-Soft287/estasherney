import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profile_doctor.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/bookinggs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutAboutdoctor extends StatelessWidget {
  const AboutAboutdoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                width: double.infinity,
                height: 190.h,
               decoration: BoxDecoration(
      gradient: AppColors.blueGradient,
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(25),
        bottomRight: Radius.circular(25),
      ),
    ),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Text(
                          'الاطباء',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "LeagueSpartan",
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(1.w, 1.h),
                                blurRadius: 2.r,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          'ابحث عن طبيبك',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "LeagueSpartan",
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(1.w, 1.h),
                                blurRadius: 2.r,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        TextFormField(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "ابحث......",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Icon(Icons.search, color: Colors.grey),
                            ),
                            contentPadding:
                                EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.r),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      right: 0.w,
                      child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 20.sp),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

            
              Padding(
                padding: EdgeInsets.all(10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios, color: AppColors.mainColor, size: 20.sp),
                    SizedBox(width: 10.w),
                    Image.asset("assets/images/Bot-Blue-Small.png", width: 50.w, height: 48.h),
                    SizedBox(width: 24.w),
                    Image.asset("assets/images/Bot-Blue-Small (1).png", width: 50.w, height: 48.h),
                    SizedBox(width: 24.w),
                    Image.asset("assets/images/Bot-Blue-Small (2).png", width: 50.w, height: 48.h),
                    SizedBox(width: 24.w),
                    Image.asset("assets/images/Bot-Blue-Small (3).png", width: 50.w, height: 48.h),
                    SizedBox(width: 10.w),
                    Icon(Icons.arrow_forward_ios, color: AppColors.mainColor, size: 20.sp),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              Column(
                children: List.generate(
                  10,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40.r,
                          backgroundImage: AssetImage("assets/images/Mask Group (3).png"),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileDoctor(),
                                ),
                              );
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "د/ محمد فتحي",
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  "أمراض القلب",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Row(
                                  children: [
                                    Icon(Icons.favorite_border, color: AppColors.mainColor, size: 20.sp),
                                    SizedBox(width: 10.w),
                                    Icon(Icons.calendar_month, color: AppColors.mainColor, size: 20.sp),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookingScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.mainColor,
                            side: BorderSide(color: AppColors.mainColor, width: 2.w),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
                            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                          ),
                          child: Text("احجز الآن"),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h), // Extra spacing for smooth scrolling
            ],
          ),
        ),
      ),
    );
  }
}
