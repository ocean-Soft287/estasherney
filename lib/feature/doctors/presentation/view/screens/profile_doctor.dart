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
                height: 220.h,
                padding: EdgeInsets.only(
                  top: 15.h,
                  bottom: 10.h,
                  left: 20.w,
                  right: 20.w,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: AppColors.blueGradient,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 130.h,
                      right: 10,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.white,
                              border: Border.all(color: Color(0xff00BBD3)),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 2.h,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  "من الإثنين إلى السبت /- 5:00 مساءً",
                                  style: TextStyle(
                                    color: AppColors.accentcolor,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Icon(Icons.alarm, color: Color(0xff33E4DB)),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.w),

                          Container(
                            width: 95,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Colors.white,
                              border: Border.all(color: Color(0xff00BBD3)),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      " 15 سنه",
                                      style: TextStyle(
                                        color: AppColors.accentcolor,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    Text(
                                      "خبره ",
                                      style: TextStyle(
                                        color: AppColors.accentcolor,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 5.w),
                                Icon(
                                  Icons.explore_outlined,
                                  color: Color(0xff33E4DB),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Favorites Icon
                    Positioned(
                      left: 5.w,
                      child: Image.asset("assets/images/Favorites-Blue.png"),
                    ),

                    Positioned(
                      right: 5.w,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          color: AppColors.wightcolor,
                        ),
                      ),
                    ),

                    Positioned(
                      right: 20.w,
                      top: 30.h,
                      child: Image.asset(
                        'assets/images/doctor.png',
                        height: 60.h,
                      ),
                    ),
                    // Doctor Name and Details
                    Positioned(
                      top: 40.h,
                      right: 100.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "د/ محمد فتحي محمد ",
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.wightcolor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "جراحة الأمراض الجلدية",
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.wightcolor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Row(
                            children: [
                              Container(
                                width: 60.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  color: AppColors.wightcolor,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("40"),
                                    SizedBox(width: 4.w),
                                    Icon(Icons.chat, size: 15.sp),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w),

                              Container(
                                width: 60.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  color: AppColors.wightcolor,
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("5"),
                                    SizedBox(width: 4.w),
                                    Icon(Icons.star, size: 15.sp),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              // Focus Section
              TweenAnimationBuilder<double>(
                tween: Tween(begin: -50.0, end: 0.0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(value, 0),
                    child: Opacity(opacity: (50 + value) / 50, child: child),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "التركيز: تأثير اختلال التوازن الهرموني على حالات الجلد، مع التخصص في حب الشباب، وزيادة الشعر، واضطرابات الجلد الأخرى.",
                        style: TextStyle(
                          color: AppColors.accentcolor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Bio Section
              TweenAnimationBuilder<double>(
                tween: Tween(begin: -50.0, end: 0.0),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(value, 0),
                    child: Opacity(opacity: (50 + value) / 50, child: child),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "حساب تعريفي",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "الدكتور [اسم الدكتور] هو [التخصص الطبي] يتمتع بخبرة تزيد عن [عدد] سنوات في مجال [مجال التخصص]. حصل على شهادته في [اسم الجامعة] وأكمل تدريبه المتقدم في [مكان التدريب أو الزمالة إن وجدت]",
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Expertise Section
              TweenAnimationBuilder<double>(
                tween: Tween(begin: -50.0, end: 0.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(value, 0),
                    child: Opacity(opacity: (50 + value) / 50, child: child),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "الخبرة الوظيفية",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "يشتهر الدكتور [اسم الدكتور] بمهاراته المتميزة في [مجال معين داخل التخصص] وحرصه الدائم على تقديم رعاية طبية متكاملة وشاملة لمرضاه. كما يحرص على متابعة أحدث التطورات الطبية والتقنيات الحديثة لضمان أفضل النتائج العلاجية",
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),

              // Highlights Section
              TweenAnimationBuilder<double>(
                tween: Tween(begin: -50.0, end: 0.0),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(value, 0),
                    child: Opacity(opacity: (50 + value) / 50, child: child),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "أبرز",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "بالإضافة إلى عمله السريري، يشارك الدكتور [اسم الدكتور] في الأنشطة البحثية والمؤتمرات العلمية، وساهم في نشر العديد من الأبحاث الطبية في مجلات علمية محكمة. كما أنه معروف بأسلوبه الإنساني في التعامل مع المرضى، حيث يولي اهتمامًا خاصًا براحتهم النفسية والجسدية",
                        style: TextStyle(
                          color: AppColors.greyColor,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
