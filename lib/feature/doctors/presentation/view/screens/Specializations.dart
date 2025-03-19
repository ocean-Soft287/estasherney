import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/doctor_for_specialization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Specializations extends StatelessWidget {
  const Specializations({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> specializations = [
      {"icon": "assets/genre/heart.png", "label": "أمراض القلب"},
      {"icon": "assets/genre/skin.png", "label": "أمراض جلدية"},
      {"icon": "assets/genre/general.png", "label": "الطب العام"},
      {"icon": "assets/genre/women.png", "label": "أمراض النساء"},
      {"icon": "assets/genre/teeth.png", "label": "طب الأسنان"},
      {"icon": "assets/genre/cancer.png", "label": "الأورام"},
      {"icon": "assets/genre/eye_medical.png", "label": "الطب البصري"},
      {"icon": "assets/genre/Bones.png", "label": "عظام"},
    ];

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
                    Column(
                      children: [
                        Text(
                          'التخصصات',
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
                            hintText: "ابحث",
                            hintStyle: TextStyle(color: Colors.grey),
                            suffixIcon: Padding(
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
                padding: EdgeInsets.all(8.0.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "التخصصات",
                    style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.all(15.0.w),
                child: GridView.builder(
                  shrinkWrap: true,  
                  physics: NeverScrollableScrollPhysics(),  
                  itemCount: specializations.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18.w,
                    mainAxisSpacing: 18.h,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DoctorForSpecialization(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(color: AppColors.mainColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              specializations[index]["icon"]!,
                              width: 50.w,
                              height: 50.h,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              specializations[index]["label"]!,
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
