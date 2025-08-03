import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/doctor_rating.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/my_appointment.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/profiledoctor/presentation/manager/rating_summary_cubit.dart';
import 'package:consult_me/patient/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/screens/setting/presentation/widget/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetBooKNow extends StatelessWidget {
  final DoctorModel doctor;

  const ResetBooKNow({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 70.h,
                decoration: BoxDecoration(
                  gradient: AppColors.blueGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.r),
                    bottomRight: Radius.circular(30.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
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

                    Expanded(
                      child: Center(
                        child: Text(
                          "الحجوزات",
                          style: GoogleFonts.leagueSpartan(
                            color: Colors.white,
                            fontSize: 22.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 48),
                  ],
                ),
              ),

              SizedBox(height: 24.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      margin: EdgeInsets.only(bottom: 20.h),
                      child: Container(
                        padding: EdgeInsets.all(16.r),
                        decoration: BoxDecoration(
                          color: AppColors.wightcolor,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.wightcolor,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.4),
                                        blurRadius: 10,
                                        offset: Offset(0, 4),
                                      ),
                                    ],
                                  ),

                                  child: CircleAvatar(
                                    radius: 50.r,
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
                                        style: GoogleFonts.leagueSpartan(
                                          color: AppColors.mainColor,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(height: 4.h),
                                      Text(
                                        doctor.specialization,
                                        style: GoogleFonts.leagueSpartan(
                                          fontSize: 14.sp,
                                          color: AppColors.greyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                BlocProvider(
                                  create:
                                      (context) =>
                                          GetIt.instance<DoctorRatingCubit>(),
                                  child: CustomRow(doctorId: doctor.id),
                                ),
                              ],
                            ),

                            SizedBox(height: 20.h),

                            Wrap(
                              spacing: 12.w,
                              runSpacing: 12.h,
                              alignment: WrapAlignment.center,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyAppointment(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.mainColor,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24.w,
                                      vertical: 12.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                    elevation: 4,
                                    shadowColor: AppColors.mainColor
                                        .withOpacity(0.3),
                                  ),
                                  child: Text(
                                    "تأكيد الحجز",
                                    style: GoogleFonts.leagueSpartan(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                DoctorRating(doctor: doctor),
                                      ),
                                    );
                                  },
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(
                                      color: AppColors.mainColor,
                                      width: 1.2,
                                    ),
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 24.w,
                                      vertical: 12.h,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.r),
                                    ),
                                  ),
                                  child: Text(
                                    "إضافة تقييم",
                                    style: GoogleFonts.leagueSpartan(
                                      color: AppColors.mainColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 16.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "القيمة:",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "${doctor.examPrice} ج.م",
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black87,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
