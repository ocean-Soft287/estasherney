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
                      right: 100,

                      child: Container(
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.explore_outlined,
                              color: Color(0xff33E4DB),
                              size: 20.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              '${doctor.yearsOfExperience} سنوات خبرة',
                              style: TextStyle(
                                color: AppColors.accentcolor,
                                fontSize: 15.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

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
                      right: 30.w,
                      top: 30.h,
                      child: ClipOval(
                        child: Image.network(
                          doctor.doctorImage,
                          width: 60.w,
                          height: 60.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 30.h,
                      right: 100.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            doctor.name,
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.wightcolor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            doctor.specialization,
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.wightcolor,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 5.h),

                          BlocProvider(
                            create: (context) => GetIt.instance<DoctorRatingCubit>(),
                            child: CustomRowRating(
                              doctorId: doctor.id,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

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
                        "الدكتور ${doctor.name} هو طبيب متخصص في ${doctor.specialization}، يتمتع بخبرة تمتد لأكثر من ${doctor.yearsOfExperience} سنوات في هذا المجال، وتخصص في ${doctor.specialization} بعد إكمال تدريبه.",
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
                        doctor.profileInfo,
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
