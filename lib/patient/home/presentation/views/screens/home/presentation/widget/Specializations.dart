import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/presentation/screens/doctor_for_specialization.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_cubit.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/presentation/manager/cubit/get_all_specialist_doctor_state.dart';
import 'package:consult_me/patient/home/presentation/views/widget/speciality_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
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
                          'التخصصات',
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: "LeagueSpartan",
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(1.w, 1.h),
                                blurRadius: 2.r,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          'ابحث عن طبيبك',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: "LeagueSpartan",
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: Offset(1.w, 1.h),
                                blurRadius: 2.r,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        TextFormField(
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: "ابحث",
                            hintStyle: TextStyle(color: Colors.grey),
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Icon(Icons.search, color: Colors.grey),
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
                          onChanged: (value) {
                            context
                                .read<GetAllSpecialistCubit>()
                                .searchSpecialist(value);
                          },
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

              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.all(8.0.w),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "التخصصات",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),

              BlocConsumer<GetAllSpecialistCubit, GetAllSpecialistState>(
                listener: (context, state) {
                  if (state is GetAllSpecialistFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("لا توجد نتائج بحث"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is GetAllSpecialistLoading) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.5,
                            ),
                        itemBuilder: (context, index) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey.shade300,
                            highlightColor: Colors.grey.shade100,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state is GetAllSpecialistSuccess) {
                    final specialists = state.specialist;
                    if (specialists.isEmpty) {
                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            SizedBox(height: 50.h),
                            SizedBox(
                              height: 200.h,
                              child: Lottie.asset(
                                "assets/lottie/Animation - 1746698083128.json",
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Text(
                              "لا توجد نتائج بحث",
                              style: TextStyle(
                                fontSize: 30.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.mainColor,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: specialists.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1.5,
                            ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
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

                            child: SpecialtyCard(
                              imagePath:
                                  specialtiesImages[index %
                                      specialtiesImages.length]["image"],
                              label: specialists[index].name,
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
