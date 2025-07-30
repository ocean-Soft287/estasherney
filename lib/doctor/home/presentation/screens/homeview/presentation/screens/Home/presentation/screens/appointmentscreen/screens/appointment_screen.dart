import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointment_day_cubit/appointment_day_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointment_day_cubit/appointment_day_state.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointmentdoctor_future_cubit/appointment_future_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointmentdoctor_future_cubit/appointment_future_state.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointmentpast/appointment_past_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/appointmentpast/appointment_past_state.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/searchappoint/searchAppontment_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/searchappoint/searchappointment_state.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => GetIt.I<SearchAppointmentCubit>(),
          child: BlocBuilder<SearchAppointmentCubit, SearchAppointmentState>(
            builder: (context, state) {
              final isSearching =
                  state is SearchAppointmentSuccess ||
                  state is SearchAppointmentLoading ||
                  state is SearchAppointmentFailure;

              return Column(
                children: [
                  SizedBox(height: 30.h),

                  Padding(
                    padding: EdgeInsets.only(right: 20.h),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.mainColor,
                          ),
                        ),
                        SizedBox(width: 100.w),
                        Text(
                          "المواعيد",
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 5.h),
                  Divider(),
                  SizedBox(height: 10.h),

                  CustomSearch(),

                  SizedBox(height: 10.h),

                  if (!isSearching) const Expanded(child: OrdersScreen()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 1
                                ? Color(0xff14C8C7)
                                : Colors.transparent,
                        borderRadius:
                            selectedIndex == 1
                                ? BorderRadius.circular(16)
                                : BorderRadius.zero,
                      ),
                      child: Center(
                        child: Text(
                          " اليوم",
                          style: GoogleFonts.leagueSpartan(
                            color:
                                selectedIndex == 1
                                    ? Colors.white
                                    : AppColors.mainColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 0
                                ? Color(0xff14C8C7)
                                : Colors.transparent,
                        borderRadius:
                            selectedIndex == 0
                                ? BorderRadius.circular(16)
                                : BorderRadius.zero,
                      ),
                      child: Center(
                        child: Text(
                          "المواعيد",
                          style: GoogleFonts.leagueSpartan(
                            color:
                                selectedIndex == 0
                                    ? Colors.white
                                    : AppColors.mainColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 2
                                ? Color(0xff14C8C7)
                                : Colors.transparent,
                        borderRadius:
                            selectedIndex == 2
                                ? BorderRadius.circular(16)
                                : BorderRadius.zero,
                      ),
                      child: Center(
                        child: Text(
                          "سجل",
                          style: TextStyle(
                            color:
                                selectedIndex == 2
                                    ? Colors.white
                                    : AppColors.mainColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50.h),
        Expanded(
          child:
              selectedIndex == 0
                  ? PreviousOrdersEmptyWidget()
                  : selectedIndex == 1
                  ? CurrentAppointmentsScreen()
                  : CanceledOrderCard(),
        ),
      ],
    );
  }
}

class PreviousOrdersEmptyWidget extends StatelessWidget {
  const PreviousOrdersEmptyWidget({super.key});

  String getTimeRemainingText(String date, String startTime, String endTime) {
    try {
      final start = DateTime.parse(
        "$date ${startTime.length == 5 ? '$startTime:00' : startTime}",
      );
      final end = DateTime.parse(
        "$date ${endTime.length == 5 ? '$endTime:00' : endTime}",
      );

      final now = DateTime.now();

      if (now.isAfter(end)) return "الموعد انتهى";
      if (now.isAfter(start) && now.isBefore(end)) return "الموعد جاري الآن";

      final diff = start.difference(now);
      final hours = diff.inHours;
      final minutes = diff.inMinutes.remainder(60);

      return "المتبقي: $hours ساعة و $minutes دقيقة";
    } catch (e) {
      return "خطأ في توقيت الموعد";
    }
  }

  IconData getSessionIcon(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return Icons.videocam;
      case 'chat':
        return Icons.chat;
      case 'call':
        return Icons.call;
      default:
        return Icons.help_outline;
    }
  }

  String getSessionNameArabic(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return 'فيديو';
      case 'chat':
        return 'محادثة';
      case 'call':
        return 'اتصال';
      default:
        return 'غير معروف';
    }
  }

  String getArabicPaymentStatus(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return 'تم الدفع';
      case 'unpaid':
        return 'لم يتم الدفع';
      default:
        return 'غير معروف';
    }
  }

  String getArabicGender(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'ذكر';
      case 'female':
        return 'أنثى';
      default:
        return 'غير محدد';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AppointmentFutureCubit>(),
      child: BlocConsumer<AppointmentFutureCubit, ApointmentFutureState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AppointmentFutureLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AppointmentFutureFailure) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  "assets/lottie/Animation - 1746698444784.json",
                  width: 180.w,
                  height: 180.h,
                ),
                Text(
                  "ليس لديك مواعيد اليوم",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "قم بتحديث أيام وساعات عملك",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "لتستقبل المواعيد المختلفة",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            );
          }

          if (state is AppointmentFutureSuccess) {
            final appointments = state.model.data;

            if (appointments.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      "assets/lottie/Animation - 1746698444784.json",
                      width: 180.w,
                      height: 180.h,
                    ),
                    Text(
                      "ليس لديك مواعيد اليوم",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "قم بتحديث أيام وساعات عملك",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "لتستقبل المواعيد المختلفة",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final item = appointments[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blueGrey),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: Icon(Icons.person, color: Colors.black),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.fullName,
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      getSessionIcon(item.sessionType),
                                      color: AppColors.mainColor,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      getSessionNameArabic(item.sessionType),
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "السجلات",
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Divider(),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.mainColor),
                              ),
                              child: Text(
                                "متابعة",
                                style: TextStyle(
                                  color: Color(0xff747474),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.mainColor),
                              ),
                              child: Text(
                                getArabicGender(item.gender),
                                style: TextStyle(
                                  color: Color(0xff747474),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                border: Border.all(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "${item.age} سنة",
                                style: TextStyle(
                                  color: Color(0xff747474),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Divider(),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "الزمن",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    getTimeRemainingText(
                                      item.date,
                                      item.slotStartTime,
                                      item.slotEndTime,
                                    ),
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30.w),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "حالة الدفع",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    getArabicPaymentStatus(item.status),
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class CurrentAppointmentsScreen extends StatelessWidget {
  const CurrentAppointmentsScreen({super.key});

  String getTimeRemainingText(String date, String startTime, String endTime) {
    try {
      final start = DateTime.parse(
        "$date ${startTime.length == 5 ? '$startTime:00' : startTime}",
      );
      final end = DateTime.parse(
        "$date ${endTime.length == 5 ? '$endTime:00' : endTime}",
      );

      final now = DateTime.now();

      if (now.isAfter(end)) return "الموعد انتهى";
      if (now.isAfter(start) && now.isBefore(end)) return "الموعد جاري الآن";

      final diff = start.difference(now);
      final hours = diff.inHours;
      final minutes = diff.inMinutes.remainder(60);

      return "المتبقي: $hours ساعة و $minutes دقيقة";
    } catch (e) {
      return "خطأ في توقيت الموعد";
    }
  }

  IconData getSessionIcon(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return Icons.videocam;
      case 'chat':
        return Icons.chat;
      case 'call':
        return Icons.call;
      default:
        return Icons.help_outline;
    }
  }

  String getSessionNameArabic(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return 'فيديو';
      case 'chat':
        return 'محادثة';
      case 'call':
        return 'اتصال';
      default:
        return 'غير معروف';
    }
  }

  String getArabicPaymentStatus(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return 'تم الدفع';
      case 'unpaid':
        return 'لم يتم الدفع';
      default:
        return 'غير معروف';
    }
  }

  String getArabicGender(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'ذكر';
      case 'female':
        return 'أنثى';
      default:
        return 'غير محدد';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AppointmentCubit>(),
      child: BlocConsumer<AppointmentCubit, AppointmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AppointmentFailure) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Lottie.asset(
                  "assets/lottie/Animation - 1746698444784.json",
                  width: 180.w,
                  height: 180.h,
                ),
                Text(
                  "ليس لديك مواعيد اليوم",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "قم بتحديث أيام وساعات عملك",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "لتستقبل المواعيد المختلفة",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            );
          }

          if (state is AppointmentSuccess) {
            final appointments = state.model.data;

            if (appointments.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Lottie.asset(
                      "assets/lottie/Animation - 1746698444784.json",
                      width: 180.w,
                      height: 180.h,
                    ),
                    Text(
                      "ليس لديك مواعيد اليوم",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "قم بتحديث أيام وساعات عملك",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "لتستقبل المواعيد المختلفة",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final item = appointments[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blueGrey),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: Icon(Icons.person, color: Colors.black),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.fullName,
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      getSessionIcon(item.sessionType),
                                      color: AppColors.mainColor,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      getSessionNameArabic(item.sessionType),
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "السجلات",
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Divider(),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.mainColor),
                              ),
                              child: Text(
                                "متابعة",
                                style: TextStyle(
                                  color: Color(0xff747474),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.mainColor),
                              ),
                              child: Text(
                                getArabicGender(item.gender),
                                style: TextStyle(
                                  color: Color(0xff747474),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                border: Border.all(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "${item.age} سنة",
                                style: TextStyle(
                                  color: Color(0xff747474),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Divider(),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "الزمن",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    getTimeRemainingText(
                                      item.date,
                                      item.slotStartTime,
                                      item.slotEndTime,
                                    ),
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30.w),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "حالة الدفع",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    getArabicPaymentStatus(item.status),
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class CanceledOrderCard extends StatelessWidget {
  const CanceledOrderCard({super.key});

  String getTimeRemainingText(String date, String startTime, String endTime) {
    try {
      final start = DateTime.parse(
        "$date ${startTime.length == 5 ? '$startTime:00' : startTime}",
      );
      final end = DateTime.parse(
        "$date ${endTime.length == 5 ? '$endTime:00' : endTime}",
      );
      final now = DateTime.now();

      if (now.isAfter(end)) return "الموعد انتهى";
      if (now.isAfter(start) && now.isBefore(end)) return "الموعد جاري الآن";

      final diff = start.difference(now);
      final hours = diff.inHours;
      final minutes = diff.inMinutes.remainder(60);

      return "المتبقي: $hours ساعة و $minutes دقيقة";
    } catch (e) {
      return "خطأ في توقيت الموعد";
    }
  }

  IconData getSessionIcon(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return Icons.videocam;
      case 'chat':
        return Icons.chat;
      case 'call':
        return Icons.call;
      default:
        return Icons.help_outline;
    }
  }

  String getSessionNameArabic(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return 'فيديو';
      case 'chat':
        return 'محادثة';
      case 'call':
        return 'اتصال';
      default:
        return 'غير معروف';
    }
  }

  String getArabicPaymentStatus(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return 'تم الدفع';
      case 'unpaid':
        return 'لم يتم الدفع';
      default:
        return 'غير معروف';
    }
  }

  String getArabicGender(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'ذكر';
      case 'female':
        return 'أنثى';
      default:
        return 'غير محدد';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) =>
              GetIt.instance<PastAppointmentCubit>()..getPastAppointments(),
      child: BlocConsumer<PastAppointmentCubit, PastAppointmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PastAppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PastAppointmentFailure) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    "assets/lottie/Animation - 1746698444784.json",
                    width: 180.w,
                    height: 180.h,
                  ),
                  Text(
                    "ليس لديك مواعيد اليوم",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "قم بتحديث أيام وساعات عملك",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "لتستقبل المواعيد المختلفة",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            );
          } else if (state is PastAppointmentSuccess) {
            final appointments = state.appointments;

            if (appointments.isEmpty) {
              return const Center(child: Text("لا يوجد مواعيد سابقة."));
            }

            return ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              shrinkWrap: true,

              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final item = appointments[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 6,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.blueGrey),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.blueGrey,
                              child: Icon(Icons.person, color: Colors.black),
                            ),
                            SizedBox(width: 8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.fullName,
                                  style: TextStyle(
                                    color: AppColors.mainColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      getSessionIcon(item.sessionType),
                                      color: AppColors.mainColor,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(
                                      getSessionNameArabic(item.sessionType),
                                      style: TextStyle(
                                        color: AppColors.mainColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "السجلات",
                                style: TextStyle(
                                  color: AppColors.mainColor,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Divider(),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.mainColor),
                              ),
                              child: Text(
                                "متابعة",
                                style: TextStyle(
                                  color: Color(0xff747474),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: AppColors.mainColor),
                              ),
                              child: Text(
                                getArabicGender(item.gender),
                                style: TextStyle(
                                  color: Color(0xff747474),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              padding: const EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                color: AppColors.wightcolor,
                                border: Border.all(color: AppColors.mainColor),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text(
                                "${item.age} سنة",
                                style: TextStyle(
                                  color: Color(0xff747474),
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8.h),
                        const Divider(),
                        SizedBox(height: 8.h),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "الزمن",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    getTimeRemainingText(
                                      item.date,
                                      item.slotStartTime,
                                      item.slotEndTime,
                                    ),
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 30.w),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "حالة الدفع",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    getArabicPaymentStatus(item.status),
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
