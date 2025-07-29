import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/rating_summary_cubit.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/widget/custom_row_rating.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDoctor extends StatelessWidget {
  final DoctorModel doctor;

  const ProfileDoctor({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: AppColors.mainColor),
              child: Center(child: Text("")),
            ),

            Container(
              height: 240.h,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 15.h,
                bottom: 10.h,
                left: 20.w,
                right: 20.w,
              ),
              decoration: BoxDecoration(
                gradient: AppColors.blueGradient,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 12,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: 5.w,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    left: 5.w,
                    child: Image.asset(
                      "assets/images/Favorites-Blue.png",
                      width: 28.w,
                      height: 28.h,
                    ),
                  ),

                  Positioned(
                    top: 50.h,
                    right: 10.w,
                    child: ClipOval(
                      child: Container(
                        width: 90.w,
                        height: 90.w,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.network(
                          doctor.doctorImage,
                          width: 90.w,
                          height: 90.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    top: 50.h,

                    right: 120.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: GoogleFonts.leagueSpartan(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          doctor.specialization,
                          style: GoogleFonts.leagueSpartan(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        BlocProvider(
                          create:
                              (context) => GetIt.instance<DoctorRatingCubit>(),
                          child: CustomRowRating(doctorId: doctor.id),
                        ),
                      ],
                    ),
                  ),

                  Positioned(
                    top: 170.h,
                    left: 10.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 6.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.r),
                        border: Border.all(
                          color: Color(0xff00BBD3),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.explore_outlined,
                            color: Color(0xff33E4DB),
                            size: 18.sp,
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            '${doctor.yearsOfExperience} سنوات خبرة',
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.accentcolor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24.h),

            TweenAnimationBuilder<double>(
              tween: Tween(begin: -50.0, end: 0.0),
              duration: Duration(milliseconds: 700),
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
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      "الدكتور ${doctor.name} هو طبيب متخصص في ${doctor.specialization}، يتمتع بخبرة تمتد لأكثر من ${doctor.yearsOfExperience} سنوات في هذا المجال، وتخصص في ${doctor.specialization} بعد إكمال تدريبه.",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.greyColor,
                        fontSize: 14.sp,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 28.h),

            TweenAnimationBuilder<double>(
              tween: Tween(begin: -50.0, end: 0.0),
              duration: Duration(milliseconds: 800),
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
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "الخبرة الوظيفية",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    Text(
                      doctor.profileInfo,
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.greyColor,
                        fontSize: 14.sp,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
