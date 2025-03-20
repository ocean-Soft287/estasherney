import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profile_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutDoctorScreen extends StatelessWidget {
  const AboutDoctorScreen({super.key});

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
                child: Column(
                  children: [
                    Text(
                      'الأطباء',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'ابحث عن طبيبك',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 15.h),

               
                    TextFormField(
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: "......ابحث",
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
              ),
              SizedBox(height: 20.h),

              // 🔹 Doctors List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5, // Number of doctors
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileDoctor()),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // 🔹 Booking Button
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: AppColors.mainColor,
                              side: BorderSide(color: AppColors.mainColor, width: 2.w),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                            ),
                            child: Text("احجز الآن", style: TextStyle(fontSize: 14.sp)),
                          ),
                          SizedBox(width: 30.w),

                          
                          Expanded(
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
                                  style: TextStyle(fontSize: 14.sp, color: AppColors.greyColor),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month, color: AppColors.mainColor, size: 20.sp),
                                    SizedBox(width: 10.w),
                                    Icon(Icons.favorite_border, color: AppColors.mainColor, size: 20.sp),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          // 🔹 Doctor Image
                          CircleAvatar(
                            radius: 40.r,
                            backgroundImage: AssetImage("assets/images/doctor.png"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
