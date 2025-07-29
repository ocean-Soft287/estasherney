import 'package:consult_me/core/constants/app_colors.dart';
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
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: CircleAvatar(radius: 45.r, backgroundColor: Colors.white),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(height: 22.h, width: 160.w, color: Colors.white),
                    SizedBox(height: 10.h),
                    Container(height: 16.h, width: 110.w, color: Colors.white),
                    SizedBox(height: 12.h),
                    Row(
                      children: [
                        Container(
                          height: 24.h,
                          width: 24.w,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12.w),
                        Container(
                          height: 24.h,
                          width: 24.w,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
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
                  padding: EdgeInsets.only(top: 24.h),
                  itemCount: 6,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, __) => buildDoctorShimmer(),
                );
              } else if (state is GetDoctorsBySpecialtySuccess) {
                if (state.doctors.isEmpty) {
                  doctorList = Padding(
                    padding: EdgeInsets.only(top: 80.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Lottie.asset(
                          'assets/lottie/Animation - 1746698083128.json',
                          width: 220.w,
                          height: 220.h,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "لا يوجد أطباء متاحين لهذا التخصص حالياً",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
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
                          horizontal: 12.w,
                          vertical: 6.h,
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
                                margin: EdgeInsets.all(6.r),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(14.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                child: Card(
                                  elevation: 0,
                                  margin: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14.r),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(12.r),
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.4,
                                                ),
                                                spreadRadius: 0,
                                                blurRadius: 6,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),

                                          child: CircleAvatar(
                                            radius: 48.r,
                                            backgroundImage: NetworkImage(
                                              doctor.doctorImage,
                                            ),
                                            backgroundColor: Colors.transparent,
                                          ),
                                        ),
                                        SizedBox(width: 16.w),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                doctor.name,
                                                style:
                                                    GoogleFonts.leagueSpartan(
                                                      color:
                                                          AppColors.mainColor,
                                                      fontSize: 15.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              SizedBox(height: 4.h),
                                              Text(
                                                doctor.specialization,
                                                style:
                                                    GoogleFonts.leagueSpartan(
                                                      fontSize: 13.sp,
                                                      color:
                                                          AppColors.greyColor,
                                                    ),
                                              ),
                                              SizedBox(height: 12.h),
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
                                                              ? AppColors
                                                                  .mainColor
                                                              : Colors.grey,
                                                      size: 22.sp,
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
                                                        } else {
                                                          await context
                                                              .read<
                                                                RemoveFavoriteDoctorCubit
                                                              >()
                                                              .removeDoctor(
                                                                doctor.id,
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
                                                  SizedBox(width: 8.w),
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
                                        SizedBox(width: 12.w),
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
                                                width: 70.w,
                                                height: 36.h,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        14.r,
                                                      ),
                                                  border: Border.all(
                                                    color: AppColors.grycolor,
                                                    width: 1.2,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                      blurRadius: 6,
                                                      offset: Offset(0, 2),
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "عرض",
                                                    style:
                                                        GoogleFonts.leagueSpartan(
                                                          color:
                                                              AppColors
                                                                  .grycolor,
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10.h),
                                            InkWell(
                                              onTap:
                                                  () => Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              BookingScreen(
                                                                doctor: doctor,
                                                              ),
                                                    ),
                                                  ),
                                              child: Container(
                                                width: 70.w,
                                                height: 36.h,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      AppColors.blueGradient,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        14.r,
                                                      ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColors.mainColor
                                                          .withOpacity(0.3),
                                                      blurRadius: 8,
                                                      offset: Offset(0, 4),
                                                    ),
                                                  ],
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "احجز الآن",
                                                    style:
                                                        GoogleFonts.leagueSpartan(
                                                          color: Colors.white,
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                  padding: EdgeInsets.only(top: 80.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Lottie.asset(
                        'assets/lottie/Animation - 1746698083128.json',
                        width: 220.w,
                        height: 220.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "لا يوجد أطباء متاحين لهذا التخصص حالياً",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
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
                        horizontal: 24.w,
                        vertical: 32.h,
                      ),
                      width: double.infinity,
                      height: 210.h,
                      decoration: BoxDecoration(
                        gradient: AppColors.blueGradient,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 12,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                selectedSpecialty,
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 26.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              Text(
                                'ابحث عن طبيبك المختص',
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 16.sp,
                                  color: Colors.white.withOpacity(0.9),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormField(
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white.withOpacity(0.95),
                                  hintText: "ابحث عن طبيب...",
                                  hintStyle: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor.withOpacity(0.6),
                                    fontSize: 14.sp,
                                  ),
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.only(
                                      right: 16.w,
                                      left: 8.w,
                                    ),
                                    child: Icon(
                                      Icons.search,
                                      color: AppColors.mainColor.withOpacity(
                                        0.7,
                                      ),
                                      size: 22.sp,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 14.h,
                                    horizontal: 20.w,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.r),
                                    borderSide: BorderSide.none,
                                  ),
                                  isDense: true,
                                ),
                                onChanged:
                                    (value) => cubit.searchDoctors(value),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 12.w,
                            top: 0.h,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.arrow_back_ios_new,
                                  size: 18,
                                  color: Colors.white,
                                ),
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

                    SizedBox(height: 30.h),
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
        final itemCount = names.isNotEmpty ? names.length : 6;

        if (state is GetAllSpecialistLoading) {
          return SizedBox(
            height: 64.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemCount: itemCount,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder:
                  (_, __) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 104.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
            ),
          );
        }

        if (state is GetAllSpecialistSuccess) {
          return SizedBox(
            height: 64.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              itemCount: names.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                final spec = names[index];
                final isSelected = spec == selected;
                return GestureDetector(
                  onTap: () => onSelect(spec),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 18.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.mainColor : Colors.white,
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color:
                            isSelected
                                ? Colors.transparent
                                : Colors.grey.shade300,
                        width: 1.2,
                      ),
                      boxShadow: [
                        if (!isSelected)
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        spec,
                        style: GoogleFonts.leagueSpartan(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontSize: 14.sp,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.w500,
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
