import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/navigation/navigation_service.dart';
import 'package:consult_me/features/call/presentation/pages/my_calls.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/presentation/screens/favourites.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_cubit.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/presentation/screens/doctor_for_specialization.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/presentation/widget/Specializations.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/presentation/widget/custom_grid_view.dart';
import 'package:consult_me/patient/home/presentation/views/widget/custom_list_view.dart';
import 'package:consult_me/patient/home/presentation/views/widget/custom_vitamin_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFFAFBFC),
        body:  SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 8.w,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        AppColors.mainColor.withOpacity(0.08),
                        Colors.transparent,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "مرحبًا في استشيرني",
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.accentcolor,
                                ),
                                textAlign: TextAlign.right,
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                "صحتك تهمنا!",
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.accentcolor.withOpacity(0.7),
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.mainColor.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Badge(
                          backgroundColor: AppColors.mainColor,
                          smallSize: 6.r,
                          child: Icon(
                            Icons.notifications_outlined,
                            size: 20.r,
                            color: AppColors.accentcolor,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 8.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20.r),
                          border: Border.all(
                            color: AppColors.mainColor.withOpacity(0.2),
                            width: 1,
                          ),
                        ),
                        child: Text(
                          "En",
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.mainColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 24.h),

                Container(
                  height: 54.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.mainColor.withOpacity(0.08),
                        spreadRadius: 0,
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(
                      color: AppColors.mainColor.withOpacity(0.1),
                      width: 1,
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16.r),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => DoctorForSpecialization(
                                  specializationName: "ابحث عن طبيب أو خدمة",
                                ),
                          ),
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search_rounded,
                              color: AppColors.mainColor,
                              size: 22.r,
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              child: Text(
                                "ابحث عن طبيب أو خدمة",
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 14.sp,
                                  color: AppColors.accentcolor.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(6.w),
                              decoration: BoxDecoration(
                                color: AppColors.mainColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Icon(
                                Icons.tune_rounded,
                                color: AppColors.mainColor,
                                size: 16.r,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 28.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "فئات",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      child: GestureDetector(
                        onTap: (){
                          NavigationService.push(MyCalls());
                        },
                        child: Text(
                          "الكل",
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                SizedBox(
                  height: 64.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => SizedBox(width: 12.w),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      final assets = [
                        "assets/images/Record.png",
                        "assets/images/Specialties.png",
                        "assets/images/Pharmacy.png",
                        "assets/images/Doctors.png",
                        "assets/images/Favorites.png",
                      ];

                      return Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.04),
                              spreadRadius: 0,
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                          border: Border.all(
                            color: AppColors.mainColor.withOpacity(0.08),
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16.r),
                          onTap:
                              index == 1
                                  ? () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => BlocProvider(
                                            create: (context) {
                                              final cubit =
                                                  GetIt.instance<
                                                    GetAllSpecialistCubit
                                                  >();
                                              cubit.getAllSpecialistDoctor();
                                              return cubit;
                                            },
                                            child: Specializations(),
                                          ),
                                    ),
                                  )
                                  : index == 3
                                  ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                DoctorForSpecialization(
                                                  specializationName:
                                                      "ابحث عن طبيب أو خدمة",
                                                ),
                                      ),
                                    );
                                  }
                                  : index == 4
                                  ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Favourites(),
                                      ),
                                    );
                                  }
                                  : null,
                          child: Image.asset(
                            assets[index],
                            height: 40.h,
                            width: 40.w,
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 32.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الجدول الزمني القادم",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          NavigationService.push(MyCalls());
                        },
                        child: Text(
                          "الكل",
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                  
                SizedBox(height: 16.h
                
                ),
                FutureAppointmentsScreen(
                  
                  
                ),
                SizedBox(height: 32.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "التخصصات",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => BlocProvider(
                                  create: (_) {
                                    final cubit =
                                        GetIt.instance<GetAllSpecialistCubit>();
                                    cubit.getAllSpecialistDoctor();
                                    return cubit;
                                  },
                                  child: Specializations(),
                                ),
                          ),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 6.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.mainColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          "الكل",
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                SizedBox(height: 260.h, child: CustomGridView()),

                SizedBox(height: 24.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الخدمات الطبيه",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      child: Text(
                        "الكل",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 16.h),

                VitaminDTestCard(),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
