import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/home/presentation/views/screens/dataview/presentation/manger/get_pationt_appointment_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/dataview/presentation/manger/get_pationt_appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

class AppointmentsScreen extends StatelessWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => GetIt.instance<GetAppointmentsCubit>()..fetchAppointments(),
      child: Scaffold(
        backgroundColor: Color(0xFFF8F9FC),
        appBar: AppBar(
          backgroundColor: AppColors.textcColor,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "الحجوزات",
            style: GoogleFonts.leagueSpartan(
              color: AppColors.wightcolor,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20.sp,
              color: AppColors.wightcolor,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: BlocBuilder<GetAppointmentsCubit, GetAppointmentsState>(
          builder: (context, state) {
            if (state is GetAppointmentsLoading) {
              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemCount: 5,
                separatorBuilder:
                    (_, __) => Divider(
                      height: 12.h,
                      thickness: 0.8,
                      color: Colors.grey.shade200,
                    ),
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 4.h),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        leading: CircleAvatar(
                          radius: 30.r,
                          backgroundColor: Colors.white,
                        ),
                        title: Container(
                          width: 120.w,
                          height: 16.h,
                          color: Colors.white,
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 8.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 16.sp,
                                  color: Colors.transparent,
                                ),
                                SizedBox(width: 6.w),
                                Container(
                                  width: 100.w,
                                  height: 14.h,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 16.sp,
                                  color: Colors.transparent,
                                ),
                                SizedBox(width: 6.w),
                                Container(
                                  width: 120.w,
                                  height: 14.h,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              width: 70.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ],
                        ),
                        isThreeLine: true,
                      ),
                    ),
                  );
                },
              );
            } else if (state is GetAppointmentsError) {
              return Center(
                child: Text(
                  "حدث خطأ",
                  style: GoogleFonts.leagueSpartan(
                    color: Colors.red.shade600,
                    fontSize: 16.sp,
                  ),
                ),
              );
            } else if (state is GetAppointmentsSuccess) {
              final appointments = state.appointments.data;

              if (appointments.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        "assets/lottie/Animation - 1746698083128.json",
                        width: 200.w,
                        height: 200.h,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "لا توجد حجوزات",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                itemCount: appointments.length,
                separatorBuilder:
                    (_, __) => Divider(
                      height: 12.h,
                      thickness: 0.8,
                      color: Colors.grey.shade200,
                    ),
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  final isPaid = appointment.status == "Paid";

                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      side: BorderSide(color: Colors.grey.shade200, width: 0.5),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 4.h),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 10.h,
                      ),
                      leading: CircleAvatar(
                        radius: 30.r,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(appointment.doctorImage),
                      ),
                      title: Text(
                        appointment.fullName,
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 16.sp,
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 16.sp,
                                  color: Colors.blue.shade600,
                                ),
                                SizedBox(width: 6.w),
                                Expanded(
                                  child: Text(
                                    "التاريخ: ${appointment.date}",
                                    style: GoogleFonts.leagueSpartan(
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  size: 16.sp,
                                  color: Colors.green.shade600,
                                ),
                                SizedBox(width: 6.w),
                                Expanded(
                                  child: Text(
                                    "الوقت: ${appointment.slotStartTime} - ${appointment.slotEndTime}",
                                    style: GoogleFonts.leagueSpartan(
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 4.h,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    isPaid
                                        ? Colors.green.shade100
                                        : Colors.red.shade100,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                isPaid ? "✅ مدفوع" : "❌ غير مدفوع",
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 13.sp,
                                  color:
                                      isPaid
                                          ? Colors.green.shade800
                                          : Colors.red.shade800,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      isThreeLine: true,
                    ),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
