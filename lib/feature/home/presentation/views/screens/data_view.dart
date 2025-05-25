import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class DataView extends StatefulWidget {
  const DataView({super.key});

  @override
  State<DataView> createState() => _DataViewState();
}

DateTime _selectedDay = DateTime.now();

class _DataViewState extends State<DataView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250.h,
                padding: EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                  gradient: AppColors.blueGradient,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 2,
                      left: 2,
                      child: Icon(
                        Icons.question_mark,
                        color: AppColors.wightcolor,
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 1,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.wightcolor,
                      ),
                    ),
                    Positioned(
                      top: 2,
                      right: 20,
                      child: Image.asset("assets/images/Group 50.png"),
                    ),
                    Positioned(
                      top: 2,
                      right: 45,
                      child: Image.asset("assets/images/Group 51.png"),
                    ),
                    Positioned(
                      top: 2,
                      right: 70,
                      child: Image.asset("assets/images/Group 52.png"),
                    ),
                    Positioned(
                      top: 2,
                      right: 100,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        width: 80,
                        height: 25,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.wightcolor,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "جدول المواعيد",
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 9,
                                color: AppColors.mainColor,
                              ),
                            ),
                            Icon(
                              Icons.calendar_month,
                              size: 17,
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 2,
                      left: 25,
                      child: Icon(
                        Icons.favorite_outline_outlined,
                        color: AppColors.wightcolor,
                      ),
                    ),
                    Positioned(
                      top: 50,
                      right: 20,
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundImage: AssetImage(
                          "assets/images/doctor.png",
                        ), // Replace with your image
                      ),
                    ),
                    SizedBox(height: 10.h),

                    Positioned(
                      top: 70,
                      right: 150,
                      child: Text(
                        "د/ محمد فتحي",
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 95,
                      right: 150,
                      child: Text(
                        "طب الأسنان",
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 18.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 130,
                      right: 150,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 43,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.wightcolor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " 30",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 10,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                Icon(
                                  Icons.chat,
                                  size: 15,
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.all(5),
                            width: 40,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColors.wightcolor,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  " 5",
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 13,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 17,
                                  color: AppColors.greyColor,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Positioned(
                      bottom: 1,
                      right: 7,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.w,
                          vertical: 8.h,
                        ),

                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.mainColor),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                        ),

                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.schedule,
                              color: AppColors.mainColor,
                              size: 20.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "من الإثنين إلى السبت | 9 صباحًا - 4 مساءً",
                              style: GoogleFonts.leagueSpartan(
                                color: AppColors.accentcolor,
                                fontSize: 16.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 15.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "الملف الشخصي",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "الدكتور [اسم الدكتور] هو [التخصص الطبي] يتمتع بخبرة تزيد عن [عدد] سنوات في مجال [مجال التخصص]. حصل على شهادته في [اسم الجامعة] وأكمل تدريبه المتقدم في [مكان التدريب أو الزمالة إن وجدت]",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[700],
                      ),
                    ),
                    SizedBox(height: 15.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "اختر التاريخ",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " الشهر",
                          style: TextStyle(
                            fontSize: 18.sp,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    TableCalendar(
                      firstDay: DateTime.utc(2023, 1, 1),
                      lastDay: DateTime.utc(2025, 12, 31),
                      focusedDay: _selectedDay,
                      calendarFormat: CalendarFormat.month,
                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                          fontSize: 18.sp,

                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      calendarStyle: CalendarStyle(
                        selectedDecoration: BoxDecoration(
                          color: AppColors.mainColor,
                          shape: BoxShape.circle,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          shape: BoxShape.circle,
                        ),
                      ),
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                        });
                      },
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
