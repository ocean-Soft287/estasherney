import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/add_rating_cubit.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/add_rating_state.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/widget/defualt_botton.dart';
import '../widget/doctor_details_info.dart';

class DoctorRating extends StatefulWidget {
  final DoctorModel doctor;

  const DoctorRating({super.key, required this.doctor});

  @override
  State<DoctorRating> createState() => _DoctorRatingState();
}

class _DoctorRatingState extends State<DoctorRating> {
  final TextEditingController commentController = TextEditingController();
  double rating = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<AddRatingCubit>(),
      child: BlocConsumer<AddRatingCubit, AddRatingState>(
        listener: (context, state) {
          if (state is AddRatingSuccess) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("تم اضافة التقييم بنجاح")));
            Navigator.pop(context);
          } else if (state is AddRatingFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.grey.shade50,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 80.h,
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
                          Center(
                            child: Text(
                              "اضافة تقييم",
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 16.w,
                            top: 20.h,
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

                    SizedBox(height: 24.h),

                    DoctorDetailsInfo(doctor: widget.doctor),

                    SizedBox(height: 24.h),

                    Text(
                      'اختر التقييم',
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.blackColor,
                      ),
                    ),

                    SizedBox(height: 12.h),

                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 6.w),
                      itemBuilder:
                          (context, _) =>
                              Icon(Icons.star, color: Colors.amber, size: 32.r),
                      onRatingUpdate: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    ),

                    SizedBox(height: 24.h),

                    Container(
                      padding: EdgeInsets.all(12.r),
                      margin: EdgeInsets.symmetric(vertical: 8.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.mainColor.withOpacity(0.2),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 180.h,
                      child: TextField(
                        controller: commentController,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          hintText: "أدخل تعليقك هنا...",
                          hintStyle: GoogleFonts.leagueSpartan(
                            fontSize: 15.sp,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w400,
                          ),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(8.r),
                          alignLabelWithHint: true,
                        ),
                        style: GoogleFonts.cairo(
                          fontSize: 15.sp,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),

                    SizedBox(height: 28.h),

                    state is AddRatingLoading
                        ? const CircularProgressIndicator()
                        : DefaultButton(
                          text: 'اضافة تقييم',
                          function: () {
                            context.read<AddRatingCubit>().submitRating(
                              doctorId: widget.doctor.id,
                              rating: rating.toInt(),
                              comment: commentController.text,
                            );
                          },
                          width: 0.9 * MediaQuery.of(context).size.width,
                        ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
