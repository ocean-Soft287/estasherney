import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/rating_summary_cubit.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/rating_summary_state.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/screens/doctor_rating_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRowRating extends StatefulWidget {
  final int doctorId;

  const CustomRowRating({super.key, required this.doctorId});

  @override
  State<CustomRowRating> createState() => _CustomRowRatingState();
}

class _CustomRowRatingState extends State<CustomRowRating> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorRatingCubit>().getDoctorRating(widget.doctorId);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorRatingCubit, DoctorRatingState>(
      builder: (context, state) {
        int totalRatings = 0;
        double averageRating = 0.0;

        if (state is DoctorRatingLoaded) {
          totalRatings = state.summary.totalRatings;
          averageRating = state.summary.averageRating;
        }

        return Row(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            DoctorRatingScreen(doctorId: widget.doctorId),
                  ),
                );
              },
              child: Container(
                width: 60.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColors.wightcolor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('$totalRatings'),
                    SizedBox(width: 4.w),
                    Icon(Icons.chat, size: 15.sp),
                  ],
                ),
              ),
            ),
            SizedBox(width: 10.w),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) =>
                            DoctorRatingScreen(doctorId: widget.doctorId),
                  ),
                );
              },
              child: Container(
                width: 60.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: AppColors.wightcolor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(averageRating.toStringAsFixed(1)),
                    SizedBox(width: 4.w),
                    Icon(Icons.star, size: 15.sp),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
