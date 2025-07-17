import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalinderDay extends StatefulWidget {
  const CalinderDay({super.key});

  @override
  State<CalinderDay> createState() => _CalinderDayState();
}

class _CalinderDayState extends State<CalinderDay> {
  DateTime selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(right: 20.h),
                child: Row(
                  children: [
                    IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios, color: AppColors.mainColor),),
                 
                    SizedBox(width: 100.w),
                    Text(
                      "التقويم",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Divider(),

              // SizedBox(height: 30.h),
             
              // Text(
              //   "عرض يومي",
              //   style: GoogleFonts.leagueSpartan(
              //     color: AppColors.mainColor,
              //     fontSize: 18,
              //     fontWeight: FontWeight.w700,
              //   ),
              // ),
              // SizedBox(height: 20.h),

              TableCalendar(
                firstDay: DateTime.utc(2023, 1, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                focusedDay: selectedDay,
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
                  return isSameDay(selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    selectedDay = selectedDay;
                  });
                },
              ),

              // Padding(
              //   padding: const EdgeInsets.only(right: 30),
              //   child: Column(
              //     children: [
              //       Row(
              //         children: [
              //           Text(
              //             ".",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Colors.red,
              //               fontSize: 40,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),

              //           Text(
              //             " مرفوض",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Colors.red,
              //               fontSize: 18,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(width: 20.w),
              //       Row(
              //         children: [
              //           Text(
              //             ".",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xff6A9ABB),
              //               fontSize: 40,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),

              //           Text(
              //             " تم التحويل",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xff6A9ABB),
              //               fontSize: 18,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(width: 20.w),
              //       Row(
              //         children: [
              //           Text(
              //             ".",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xffE3BA48),
              //               fontSize: 40,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),

              //           Text(
              //             " قيد الانتظار",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xffE3BA48),
              //               fontSize: 18,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(width: 20.w),
              //       Row(
              //         children: [
              //           Text(
              //             ".",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xff5CCEA0),
              //               fontSize: 40,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),

              //           Text(
              //             " تمت الموافقة",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xff5CCEA0),
              //               fontSize: 18,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(width: 20.w),
              //       Row(
              //         children: [
              //           Text(
              //             ".",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xff3B3C3E),
              //               fontSize: 40,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),

              //           Text(
              //             " تم الإلغاء",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xff3B3C3E),
              //               fontSize: 18,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(width: 20.w),
              //       Row(
              //         children: [
              //           Text(
              //             ".",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xffD9D9D9),
              //               fontSize: 40,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),

              //           Text(
              //             " تم بنجاح ",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xffD9D9D9),
              //               fontSize: 18,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //       SizedBox(width: 20.w),
              //       Row(
              //         children: [
              //           Text(
              //             ".",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xffBFB767),
              //               fontSize: 40,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),

              //           Text(
              //             " لم يتم ",
              //             style: GoogleFonts.leagueSpartan(
              //               color: Color(0xffBFB767),
              //               fontSize: 18,
              //               fontWeight: FontWeight.w700,
              //             ),
              //           ),
              //         ],
              //       ),
              //     ],
              //   ),
              // ),
         
            ],
          ),
        ),
      ),
    );
  }
}
