import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/get_future_pationt_appointment/get_future_pationt_appointment_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/presentation/manager/get_future_pationt_appointment/get_future_pationt_appointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class FutureAppointmentsScreen extends StatelessWidget {

 const  FutureAppointmentsScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GetIt.instance<AppointmentsPationtCubit>()..getAllAppointments(),
      child: BlocBuilder<AppointmentsPationtCubit, AppointmentsPationtState>(
        builder: (context, state) {
          if (state is AppointmentsPationtLoading) {
            return _buildShimmerLoading();
          } else if (state is AppointmentsPationtSuccess) {
            final appointments = state.response.data;

            if (appointments.isEmpty) {
              return _buildEmptyCard(context);
            }

            return SizedBox(
              height: 170.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: appointments.length,
                itemBuilder: (context, index) {
                  final item = appointments[index];

                  // نحدد الأيقونة واللون حسب نوع الجلسة مباشرة هنا
                  IconData sessionIcon;
                  Color backgroundColor;

                  switch (item.sessionType.toLowerCase()) {
                    case 'video':
                      sessionIcon = Icons.videocam;
                      backgroundColor = Colors.blue.shade100;
                      break;
                    case 'chat':
                    case 'text':
                      sessionIcon = Icons.message;
                      backgroundColor = Colors.grey.shade200;
                      break;
                    case 'call':
                    case 'audio':
                      sessionIcon = Icons.call;
                      backgroundColor = Colors.green.shade100;
                      break;
                    default:
                      sessionIcon = Icons.help_outline;
                      backgroundColor = Colors.white;
                  }

                  return Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Stack(
                      children: [
                        Container(
                          width: 340.w,
                          height: 150.h,
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 50.w,
                                            height: 50.w,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
                                                  blurRadius: 6,
                                                  offset: Offset(0, 4),
                                                ),
                                              ],
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  item.doctorImage,
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                item.doctorName,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Text(
                                                item.doctorSpecialization,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.date,
                                        style: GoogleFonts.leagueSpartan(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Text(
                                        "${item.slotStartTime} - ${item.slotEndTime}",
                                        style: GoogleFonts.leagueSpartan(
                                          color: Colors.white,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                  // الأيقونة حسب نوع الجلسة هنا مباشرة
                                  CircleAvatar(
                                    backgroundColor: backgroundColor,
                                    child: Icon(
                                      sessionIcon,
                                      color: const Color(0xff96A7AF),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 30.h,
                          left: 20.w,
                          child: Image.asset("assets/images/Group 19.png"),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          } else if (state is AppointmentsPationtFailure) {
            return Center(child: Text('فشل في جلب البيانات: ${state.error}'));
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }

  Widget _buildEmptyCard(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: double.infinity,
        height: 150.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'لا توجد مواعيد قادمة',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'يمكنك حجز موعد جديد الآن.',
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.mainColor,
                ),
                onPressed: () {
                  
                  
                },
                child: Text('احجز ميعاد'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerLoading() {
    return SizedBox(
      height: 170.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 340.w,
                height: 150.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
