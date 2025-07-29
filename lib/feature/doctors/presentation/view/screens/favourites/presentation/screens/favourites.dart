import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/manager/deleate_favourite/deleate_favourite_cubit.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/manager/deleate_favourite/deleate_favourite_state.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/manager/get_all_favourite/get_all_favourite_cubit.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/manager/get_all_favourite/get_all_favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';
import '../widget/doctors_widget.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  GetIt.instance<GetAllFavouriteDoctorsCubit>()
                    ..getAllFavouriteDoctors(),
        ),
        BlocProvider(
          create: (context) => GetIt.instance<RemoveFavoriteDoctorCubit>(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Color(0xFFF8F9FC),
        body: BlocConsumer<
          RemoveFavoriteDoctorCubit,
          RemoveFavoriteDoctorState
        >(
          listener: (context, removeState) {
            if (removeState is RemoveFavoriteDoctorSuccess) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("تم الحذف بنجاح")));
              context
                  .read<GetAllFavouriteDoctorsCubit>()
                  .getAllFavouriteDoctors();
            } else if (removeState is RemoveFavoriteDoctorFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("فشل الحذف: ${removeState.message}")),
              );
            }
          },
          builder: (context, removeState) {
            return BlocBuilder<
              GetAllFavouriteDoctorsCubit,
              GetAllFavouriteDoctorsState
            >(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      height: 100.h,
                      width: double.infinity,
                      alignment: Alignment.center,
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
                            top: 45.h,
                            right: 150.h,
                            child: Text(
                              " المفضله",
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 16.w,
                            top: 30.h,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20.h),

                   
                    if (state is GetAllFavouriteDoctorsLoading)
                      Expanded(
                        child: ListView.separated(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                          itemBuilder:
                              (context, index) => const ShimmerDoctorItem(),
                          separatorBuilder: (_, __) => SizedBox(height: 12.h),
                          itemCount: 5,
                        ),
                      )
                    
                    else if (state is GetAllFavouriteDoctorsFailure)
                      Expanded(
                        child: Center(
                          child: Text(
                            "حدث خطأ: ${state.message}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.red.shade600,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                   
                    else if (state is GetAllFavouriteDoctorsSuccess)
                      if (state.doctors.isEmpty)
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  size: 60.r,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  "لا يوجد أطباء في المفضلة",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 12.h,
                            ),
                            itemBuilder: (context, index) {
                              final doctor = state.doctors[index];
                              return DoctorsWidget(
                                doctorName: doctor.doctorName,
                                specialization: doctor.specialization,
                                imageUrl: doctor.image,
                                onDelete: () {
                                  context
                                      .read<RemoveFavoriteDoctorCubit>()
                                      .removeDoctor(doctor.doctorId);
                                },
                              );
                            },
                            separatorBuilder: (_, __) => SizedBox(height: 12.h),
                            itemCount: state.doctors.length,
                          ),
                        )
                    
                    else
                      Expanded(
                        child: Center(
                          child: Text(
                            "لا توجد بيانات",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class ShimmerDoctorItem extends StatelessWidget {
  const ShimmerDoctorItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 90.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
        
            Container(
              margin: EdgeInsets.all(8.r),
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),

            
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 130.w,
                      height: 16.h,
                      color: Colors.grey[300],
                      margin: EdgeInsets.only(bottom: 10.h),
                    ),
                    Container(
                      width: 90.w,
                      height: 14.h,
                      color: Colors.grey[300],
                    ),
                  ],
                ),
              ),
            ),

          
            Container(
              margin: EdgeInsets.only(right: 12.w),
              width: 28.w,
              height: 28.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
