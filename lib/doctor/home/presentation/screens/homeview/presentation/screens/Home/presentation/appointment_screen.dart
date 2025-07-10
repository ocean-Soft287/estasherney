import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/widget/appointment_day_cubit/appointment_day_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/widget/appointment_day_cubit/appointment_day_state.dart';
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
        body: Column(
          children: [
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(right: 20.h),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
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
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "البحث باسم المريض",
                        hintStyle: GoogleFonts.leagueSpartan(
                          color: Color(0xff747474),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.mainColor,
                        ),

                        fillColor: AppColors.greyColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),

                          borderSide: BorderSide(color: AppColors.mainColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.filter_alt_outlined,
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "الفلترة",
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            const Expanded(child: OrdersScreen()),
          ],
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
                  : ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return CanceledOrderCard();
                    },
                  ),
        ),
      ],
    );
  }
}

class PreviousOrdersEmptyWidget extends StatelessWidget {
  const PreviousOrdersEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          "assets/lottie/Animation - 1746698444784.json",
          width: 180.w,
          height: 180.h,
        ),
        Text(
          "ليس لديك مواعيد اليوم",
          style: GoogleFonts.leagueSpartan(
            color: AppColors.mainColor,
            fontSize: 18.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "قم بتحديث أيام وساعات عملك",
          style: GoogleFonts.leagueSpartan(
            color: const Color(0xff747474),
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "لتستقبل المواعيد المختلفة",
          style: GoogleFonts.leagueSpartan(
            color: const Color(0xff747474),
            fontSize: 15.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class CurrentAppointmentsScreen extends StatelessWidget {
  const CurrentAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AppointmentCubit>(),
      child: BlocConsumer<AppointmentCubit, AppointmentState>(
        listener: (context, state) {
          if (state is AppointmentFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error.split('\n').first)),
            );
          }
        },
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AppointmentFailure) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    "assets/lottie/Animation - 1746698444784.json", // أو أي صورة خطأ عندك
                    width: 180.w,
                    height: 180.h,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "حدث خطأ أثناء تحميل المواعيد",
                    style: GoogleFonts.leagueSpartan(
                      color: Colors.red,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    state.error,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.leagueSpartan(
                      color: Colors.grey,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is AppointmentSuccess) {
            if (state.appointments.isEmpty) {
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
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "قم بتحديث أيام وساعات عملك",
                      style: GoogleFonts.leagueSpartan(
                        color: const Color(0xff747474),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "لتستقبل المواعيد المختلفة",
                      style: GoogleFonts.leagueSpartan(
                        color: const Color(0xff747474),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: state.appointments.length,
                itemBuilder: (context, index) {
                  final appointment = state.appointments[index];
                  return ListTile(
                    leading: const Icon(Icons.calendar_today),
                    title: Text(appointment.name ?? "مريض غير معروف"),
                    subtitle: Text(
                      "الحالة: ${appointment.status ?? "غير معروف"}",
                    ),
                  );
                },
              );
            }
          }

          return const SizedBox(); // fallback in case no state matches
        },
      ),
    );
  }
}

class CanceledOrderCard extends StatelessWidget {
  const CanceledOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xffD9D9D9)),
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
                      "ليلي محمد",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.home, color: AppColors.mainColor),
                        SizedBox(width: 4.w),
                        Text(
                          "رساله",
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "متابعه",
                    style: TextStyle(
                      color: AppColors.wightcolor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "انثي",
                    style: TextStyle(
                      color: AppColors.wightcolor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "٢٨سنه",
                    style: TextStyle(
                      color: AppColors.wightcolor,
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
                          color: const Color.fromARGB(255, 9, 9, 10),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "21-3",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "حاله الموعد",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 9, 9, 10),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "تم بنجاح",
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "حاله الدفع",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 9, 9, 10),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "تم الانتهاء",
                        style: TextStyle(
                          color: AppColors.mainColor,
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
  }
}
