import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/about_aboutdoctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Specializations extends StatelessWidget {
  const Specializations({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> specializations = [
      {"icon": "assets/genre/skin.png", "label": "أمراض جلدية"},
      {"icon": "assets/genre/heart.png", "label": "أمراض القلب"},
      {"icon": "assets/genre/women.png", "label": "أمراض النساء"},
      {"icon": "assets/genre/general.png", "label": "الطب العام"},
      {"icon": "assets/genre/cancer.png", "label": "الأورام"},
      {"icon": "assets/genre/teeth.png", "label": "طب الأسنان"},
      {"icon": "assets/genre/Bones.png", "label": "عظام"},
      {"icon": "assets/genre/eye_medical.png", "label": "الطب البصري"},
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
                            prefixIcon: Padding(
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
                        Icons.arrow_back_ios_outlined,
                        size: 20,
                        color: AppColors.wightcolor,
                      ),
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
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
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
                    return TweenAnimationBuilder<Offset>(
                      duration: Duration(milliseconds: 800 + index * 100),
                      tween: Tween<Offset>(
                        begin: Offset(-1.5, 0),
                        end: Offset.zero,
                      ),
                      curve: Curves.easeOut,
                      builder: (context, offset, child) {
                        return Transform.translate(
                          offset: Offset(offset.dx * 50.w, 0),
                          child: child,
                        );
                      },
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AboutAboutdoctor(),
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
                              SizedBox(height: 15.h),
                              Text(
                                specializations[index]["label"]!,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: AppColors.mainColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
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
