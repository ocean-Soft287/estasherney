import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/presentation/manager/add_rating_cubit.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/presentation/manager/add_rating_state.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        gradient: AppColors.blueGradient,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              "اضافة تقييم",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: Appfonts.font,
                                color: AppColors.wightcolor,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 16,
                            top: 16,
                            child: InkWell(
                              onTap: () => Navigator.pop(context),
                              child: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    DoctorDetailsInfo(doctor: widget.doctor),

                    20.verticalSpace,

                    Text(
                      'اختر التقييم',
                      style: GoogleFonts.cairo(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackColor,
                      ),
                    ),
                    SizedBox(height: 10.h),

                    RatingBar.builder(
                      initialRating: rating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder:
                          (context, _) => const Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                          ),
                      onRatingUpdate: (value) {
                        setState(() {
                          rating = value;
                        });
                      },
                    ),

                    10.verticalSpace,

                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColors.mainColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: MediaQuery.of(context).size.width * .9,
                      height: 200.h,
                      child: TextField(
                        controller: commentController,
                        maxLines: 10,
                        decoration: InputDecoration(
                          hintText: "أدخل تعليقك هنا...",
                          hintStyle: GoogleFonts.leagueSpartan(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: AppColors.blackColor,
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    20.verticalSpace,

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

                    20.verticalSpace,
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
