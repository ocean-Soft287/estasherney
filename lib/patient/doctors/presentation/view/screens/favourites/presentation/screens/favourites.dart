import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/presentation/manager/deleate_favourite/deleate_favourite_cubit.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/presentation/manager/deleate_favourite/deleate_favourite_state.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/presentation/manager/get_all_favourite/get_all_favourite_cubit.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/presentation/manager/get_all_favourite/get_all_favourite_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import '../widget/doctors_widget.dart';
import '../../../../widget/header_container.dart';

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
        body: SafeArea(
          child: BlocConsumer<
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
                      HeaderContainer(title: "المفضلة"),
                      SizedBox(height: 20.h),
                      if (state is GetAllFavouriteDoctorsLoading)
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
                            ),
                            itemBuilder:
                                (context, index) => const ShimmerDoctorItem(),
                            separatorBuilder:
                                (context, index) => SizedBox(height: 10.h),
                            itemCount: 5,
                          ),
                        )
                      else if (state is GetAllFavouriteDoctorsFailure)
                        Center(child: Text("حدث خطأ: ${state.message}"))
                      else if (state is GetAllFavouriteDoctorsSuccess)
                        Expanded(
                          child: ListView.separated(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 10.h,
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
                            separatorBuilder:
                                (context, index) => SizedBox(height: 10.h),
                            itemCount: state.doctors.length,
                          ),
                        )
                      else
                        const Center(child: Text("لا توجد بيانات")),
                    ],
                  );
                },
              );
            },
          ),
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
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Row(
          children: [
            Container(
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 120.w,
                    height: 14.h,
                    color: Colors.grey[300],
                  ),
                  SizedBox(height: 8.h),
                  Container(width: 80.w, height: 12.h, color: Colors.grey[300]),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            Container(
              width: 24.w,
              height: 24.h,
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
