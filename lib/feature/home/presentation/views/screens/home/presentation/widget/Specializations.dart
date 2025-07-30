import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/screens/doctor_for_specialization.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_state.dart';
import 'package:consult_me/feature/home/presentation/views/widget/speciality_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class Specializations extends StatelessWidget {
  const Specializations({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> specialtiesImages = [
      {"image": "assets/images/Component 29 (2).png"},
      {"image": "assets/images/Component 29 (1).png"},
      {"image": "assets/images/Component 29.png"},
      {"image": "assets/images/Component 29 (5).png"},
      {"image": "assets/images/Component 29 (4).png"},
      {"image": "assets/images/Component 29 (3).png"},
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFFAFBFC),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
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
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  Stack(
                    children: [
                      Positioned(
                        bottom: -40.h,
                        right: -20.w,
                        child: Container(
                          width: 80.w,
                          height: 80.h,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(40.r),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'التخصصات',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.2),
                                  offset: Offset(0.w, 2.h),
                                  blurRadius: 4.r,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            'ابحث عن طبيبك',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white.withOpacity(0.9),
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.15),
                                  offset: Offset(0.w, 1.h),
                                  blurRadius: 2.r,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "ابحث عن التخصص المطلوب...",
                                hintStyle: GoogleFonts.leagueSpartan(
                                  color: Colors.grey.shade500,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                prefixIcon: Container(
                                  margin: EdgeInsets.all(8.w),
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    color: AppColors.mainColor.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(12.r),
                                  ),
                                  child: Icon(
                                    Icons.search_rounded,
                                    color: AppColors.mainColor,
                                    size: 20.r,
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                  horizontal: 20.w,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                  borderSide: BorderSide(
                                    color: Colors.white.withOpacity(0.8),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.r),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    width: 2,
                                  ),
                                ),
                              ),
                              onChanged: (value) {
                                context
                                    .read<GetAllSpecialistCubit>()
                                    .searchSpecialist(value);
                              },
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        right: 0.w,
                        top: 0.h,
                        child: Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.3),
                              width: 1,
                            ),
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(12.r),
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.arrow_back_ios_outlined,
                              size: 18.r,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "جميع التخصصات",
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            BlocConsumer<GetAllSpecialistCubit, GetAllSpecialistState>(
              listener: (context, state) {
                if (state is GetAllSpecialistFailure) {}
              },
              builder: (context, state) {
                if (state is GetAllSpecialistLoading) {
                  return Padding(
                    padding: EdgeInsets.all(16.w),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey,
                          period: const Duration(milliseconds: 1200),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  spreadRadius: 0,
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50.w,
                                  height: 50.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(16.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 6,
                                        offset: Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 12.h),

                                Container(
                                  width: 80.w,
                                  height: 12.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(6.r),
                                  ),
                                ),
                                SizedBox(height: 6.h),

                                Container(
                                  width: 60.w,
                                  height: 8.h,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is GetAllSpecialistSuccess) {
                  final specialists = state.specialist;
                  if (specialists.isEmpty) {
                    return Container(
                      margin: EdgeInsets.all(24.w),
                      padding: EdgeInsets.all(32.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            spreadRadius: 0,
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                            child: SizedBox(
                              height: 150.h,
                              child: Lottie.asset(
                                "assets/lottie/Animation - 1746698083128.json",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Text(
                            "لا توجد نتائج بحث",
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.mainColor,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            "جرب البحث بكلمات مختلفة",
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.all(16.w),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: specialists.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                        childAspectRatio: 1.4,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.r),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.08),
                                spreadRadius: 0,
                                blurRadius: 15,
                                offset: const Offset(0, 5),
                              ),
                              BoxShadow(
                                color: AppColors.mainColor.withOpacity(0.05),
                                spreadRadius: 0,
                                blurRadius: 20,
                                offset: const Offset(0, 10),
                              ),
                            ],
                            border: Border.all(
                              color: Colors.grey.shade100,
                              width: 1,
                            ),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(20.r),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => DoctorForSpecialization(
                                          specializationName:
                                              specialists[index].name,
                                        ),
                                  ),
                                );
                              },
                              splashColor: AppColors.mainColor.withOpacity(0.1),
                              highlightColor: AppColors.mainColor.withOpacity(
                                0.05,
                              ),
                              child: SpecialtyCard(
                                imagePath:
                                    specialtiesImages[index %
                                        specialtiesImages.length]["image"],
                                label: specialists[index].name,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Container(
                  height: 200.h,
                  margin: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          "assets/lottie/Animation - 1746698083128.json",
                          width: 300.w,
                          height: 170.h,
                          fit: BoxFit.contain,
                        ),
                        Text(
                          "لا توجد نتائج بحث",
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 15.sp,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
