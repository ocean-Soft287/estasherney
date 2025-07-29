import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/booking/presentation/screens/booking_page.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/manager/deleate_favourite/deleate_favourite_cubit.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/manager/post_favourite/post_favourite_cubit.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/manager/post_favourite/post_favourite_state.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/screens/profile_doctor.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_state.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/getdoctor/get_doctor_pationt_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/getdoctor/get_doctor_pationt_state.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/bookinggs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class DoctorForSpecialization extends StatefulWidget {
  final String specializationName;

  const DoctorForSpecialization({super.key, required this.specializationName});

  @override
  State<DoctorForSpecialization> createState() =>
      _DoctorForSpecializationState();
}

class _DoctorForSpecializationState extends State<DoctorForSpecialization> {
  late GetDoctorsBySpecialtyCubit cubit;
  late String selectedSpecialty;

  @override
  void initState() {
    super.initState();
    selectedSpecialty = widget.specializationName;
    cubit = GetIt.I<GetDoctorsBySpecialtyCubit>();
    cubit.fetchDoctors(selectedSpecialty);
  }

  Widget buildDoctorShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: CircleAvatar(radius: 40.r, backgroundColor: Colors.white),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 20.h, width: 150.w, color: Colors.white),
                  SizedBox(height: 8.h),
                  Container(height: 14.h, width: 100.w, color: Colors.white),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Container(height: 20.h, width: 20.w, color: Colors.white),
                      SizedBox(width: 10.w),
                      Container(height: 20.h, width: 20.w, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cubit),
        BlocProvider(
          create:
              (_) => GetIt.I<GetAllSpecialistCubit>()..getAllSpecialistDoctor(),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: BlocBuilder<
            GetDoctorsBySpecialtyCubit,
            GetDoctorsBySpecialtyState
          >(
            builder: (context, state) {
              Widget doctorList;

              if (state is GetDoctorsBySpecialtyLoading) {
                doctorList = ListView.builder(
                  padding: EdgeInsets.only(top: 20.h),
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, __) => buildDoctorShimmer(),
                );
              } else if (state is GetDoctorsBySpecialtySuccess) {
                if (state.doctors.isEmpty) {
                  doctorList = Padding(
                    padding: EdgeInsets.only(top: 60.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          'assets/lottie/Animation - 1746698083128.json',
                          width: 200.w,
                          height: 200.h,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "لا يوجد أطباء متاحين لهذا التخصص حالياً",
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  doctorList = Column(
                    children: List.generate(state.doctors.length, (index) {
                      final doctor = state.doctors[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 5.h,
                        ),
                        child: BlocProvider(
                          create: (_) => GetIt.I<SetFavoriteDoctorCubit>(),
                          child: BlocConsumer<
                            SetFavoriteDoctorCubit,
                            SetFavoriteDoctorState
                          >(
                            listener: (context, favState) {
                              if (favState is SetFavoriteDoctorSuccess) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("تمت الإضافة للمفضلة"),
                                  ),
                                );
                              } else if (favState is SetFavoriteDoctorFailure) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("فشل: ${favState.message}"),
                                  ),
                                );
                              }
                            },
                            builder: (context, favState) {
                              return Container(
                                margin: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 1,
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 40.r,
                                          backgroundImage: NetworkImage(
                                            doctor.doctorImage,
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                doctor.name,
                                                style: TextStyle(
                                                  color: AppColors.mainColor,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Text(
                                                doctor.specialization,
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color: AppColors.greyColor,
                                                ),
                                              ),
                                              SizedBox(height: 8.h),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      doctor.isFavorite
                                                          ? Icons.favorite
                                                          : Icons
                                                              .favorite_border,
                                                      color:
                                                          doctor.isFavorite
                                                              ? Colors.red
                                                              : Colors.grey,
                                                      size: 20.sp,
                                                    ),
                                                    onPressed: () async {
                                                      final isNowFavorite =
                                                          !doctor.isFavorite;

                                                      setState(() {
                                                        doctor.isFavorite =
                                                            isNowFavorite;
                                                      });

                                                      try {
                                                        if (isNowFavorite) {
                                                          await context
                                                              .read<
                                                                SetFavoriteDoctorCubit
                                                              >()
                                                              .setFavoriteDoctors(
                                                                [doctor.id],
                                                              );
                                                          ScaffoldMessenger.of(
                                                            context,
                                                          ).showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                "تمت الإضافة إلى المفضلة",
                                                              ),
                                                            ),
                                                          );
                                                        } else {
                                                          await context
                                                              .read<
                                                                RemoveFavoriteDoctorCubit
                                                              >()
                                                              .removeDoctor(
                                                                doctor.id,
                                                              );
                                                          ScaffoldMessenger.of(
                                                            context,
                                                          ).showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                "تمت الإزالة من المفضلة",
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                      } catch (e) {
                                                        setState(() {
                                                          doctor.isFavorite =
                                                              !isNowFavorite;
                                                        });
                                                        ScaffoldMessenger.of(
                                                          context,
                                                        ).showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              "حدث خطأ. حاول مرة أخرى",
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  ),

                                                  SizedBox(width: 10.w),
                                                  Icon(
                                                    Icons.calendar_month,
                                                    color: AppColors.mainColor,
                                                    size: 20.sp,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.w),
                                        Column(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder:
                                                        (context) =>
                                                            ProfileDoctor(
                                                              doctor: doctor,
                                                            ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: 60.w,
                                                height: 33.h,
                                                padding: EdgeInsets.all(5.r),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        12.r,
                                                      ),
                                                  border: Border.all(
                                                    color: AppColors.grycolor,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "عرض",
                                                    style:
                                                        GoogleFonts.leagueSpartan(
                                                          color:
                                                              AppColors
                                                                  .grycolor,
                                                          fontSize: 12.sp,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 15.h),
                                            InkWell(
                                              onTap:
                                                  () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              BookingPage(
                                                        doctor: doctor,
                                                              ),
                                                    ),
                                                  ),
                                              child: Container(
                                                width: 60.w,
                                                height: 33.h,
                                                padding: EdgeInsets.all(5.r),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        12.r,
                                                      ),
                                                  border: Border.all(
                                                    color: AppColors.mainColor,
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    " احجز الان",
                                                    style:
                                                        GoogleFonts.leagueSpartan(
                                                          color:
                                                              AppColors
                                                                  .mainColor,
                                                          fontSize: 12.sp,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    }),
                  );
                }
              } else if (state is GetDoctorsBySpecialtyFailure) {
                doctorList = Padding(
                  padding: EdgeInsets.only(top: 60.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        'assets/lottie/Animation - 1746698083128.json',
                        width: 200.w,
                        height: 200.h,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "لا يوجد أطباء متاحين لهذا التخصص حالياً",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                doctorList = const SizedBox.shrink();
              }

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                        vertical: 30.h,
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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                selectedSpecialty,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'ابحث عن طبيبك',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 15.h),
                              TextFormField(
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: "ابحث .....",
                                  hintStyle: TextStyle(
                                    color: AppColors.mainColor,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: Icon(
                                      Icons.search,
                                      color: AppColors.mainColor,
                                    ),
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
                                onChanged:
                                    (value) => cubit.searchDoctors(value),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0.w,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back_ios_outlined,
                                size: 20,
                                color: AppColors.wightcolor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GetAllSpecialist(
                      selected: selectedSpecialty,
                      onSelect: (newSpec) {
                        setState(() {
                          selectedSpecialty = newSpec;
                          cubit.fetchDoctors(newSpec);
                        });
                      },
                    ),
                    doctorList,
                    SizedBox(height: 20.h),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class GetAllSpecialist extends StatelessWidget {
  final String selected;
  final Function(String) onSelect;

  const GetAllSpecialist({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllSpecialistCubit, GetAllSpecialistState>(
      builder: (context, state) {
        List<String> names = [];

        if (state is GetAllSpecialistSuccess) {
          names = state.specialist.map((s) => s.name).toList();
        }

        final count = names.isNotEmpty ? names.length : 6;

        if (state is GetAllSpecialistLoading) {
          return SizedBox(
            height: 60.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: count,
              separatorBuilder: (_, __) => SizedBox(width: 10.w),
              itemBuilder:
                  (_, __) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                  ),
            ),
          );
        }

        if (state is GetAllSpecialistSuccess) {
          return SizedBox(
            height: 60.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemCount: names.length,
              separatorBuilder: (_, __) => SizedBox(width: 10.w),
              itemBuilder: (context, index) {
                final spec = names[index];
                final isSelected = spec == selected;

                return GestureDetector(
                  onTap: () => onSelect(spec),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isSelected
                              ? AppColors.mainColor
                              : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Center(
                      child: Text(
                        spec,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
