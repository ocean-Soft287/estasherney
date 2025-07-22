import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/screens/doctor_for_specialization.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/widget/Specializations.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/widget/custom_grid_view.dart';
import 'package:consult_me/feature/home/presentation/views/widget/custom_list_view.dart';
import 'package:consult_me/feature/home/presentation/views/widget/custom_vitamin_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "!مرحبًا في استشيرني،صحتك تهمنا",
                          style: GoogleFonts.leagueSpartan(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                    Spacer(),
                    Badge(
                      backgroundColor: AppColors.mainColor,
                      child: Icon(Icons.notifications_outlined, size: 22.r),
                    ),
                    SizedBox(width: 5.w),
                    Text(
                      "En",
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.accentcolor,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 15.h),

                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.wightcolor,

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: InkWell(
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
                    child: Row(
                      children: [
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Text(
                            "ابحث عن طبيب أو خدمة",
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 14.sp,
                              color: AppColors.accentcolor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "فئات",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "الكل",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                SizedBox(
                  height: 50.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset("assets/images/Record.png"),
                      SizedBox(width: 5.w),
                      InkWell(
                        onTap:
                            () => Navigator.push(
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
                            ),
                        child: Image.asset("assets/images/Specialties.png"),
                      ),

                      SizedBox(width: 5.w),
                      Image.asset("assets/images/Pharmacy.png"),
                      SizedBox(width: 5.w),
                      InkWell(
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
                        child: Image.asset("assets/images/Doctors.png"),
                      ),
                      SizedBox(width: 5.w),
                      Image.asset("assets/images/Favorites.png"),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الجدول الزمني القادم",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "الكل",
                      style: GoogleFonts.leagueSpartan(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.accentcolor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
                CustomListView(),

                SizedBox(height: 10.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "التخصصات",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
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

                      child: Text(
                        "الكل",
                        style: GoogleFonts.leagueSpartan(
                          decoration: TextDecoration.lineThrough,
                          color: AppColors.accentcolor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

                SizedBox(height: 260.h, child: CustomGridView()),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "الخدمات الطبيه",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.accentcolor,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "الكل",
                      style: GoogleFonts.leagueSpartan(
                        decoration: TextDecoration.lineThrough,
                        color: AppColors.accentcolor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                VitaminDTestCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
