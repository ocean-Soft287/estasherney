import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/about_aboutdoctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorForSpecialization extends StatelessWidget {
  const DoctorForSpecialization({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
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
                  Column(
                    children: [
                      Text(
                        'امراض القلب',
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
                          hintText: "....ابحث",
                          hintStyle: TextStyle(color: Colors.grey),
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(left: 10.w),
                            child: Icon(Icons.search, color: Colors.grey),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h,
                            horizontal: 20.w,
                          ),
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
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 10.h,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.mainColor,
                              side: BorderSide(
                                color: AppColors.mainColor,
                                width: 2.w,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 8.h,
                              ),
                            ),
                            child: Text(
                              "احجز الآن",
                              style: TextStyle(fontSize: 14.sp),
                            ),
                          ),

                          SizedBox(width: 55.w),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AboutAboutdoctor(),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "د/ محمد فتحي",
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    "أمراض القلب",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.greyColor,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.calendar_month,
                                          color: AppColors.mainColor,
                                          size: 20.sp,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.favorite_border,
                                          color: AppColors.mainColor,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),

                          CircleAvatar(
                            radius: 40.r,
                            backgroundImage: AssetImage(
                              "assets/images/Mask Group (3).png",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
