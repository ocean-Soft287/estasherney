import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/models/post_available_request.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/logic/availabledoctor/doctor_availble_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/widget/custom_price.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/widget/custom_price_screen.dart';
import 'package:consult_me/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableOnline extends StatelessWidget {
  final LoginModel user;
  const AvailableOnline({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: SingleChildScrollView(
            child: BlocProvider(
              create: (context) => GetIt.I<AddAvailabilityCubit>(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Row(
                    children: [
                      Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
                      SizedBox(width: 60.w),
                      Text(
                        "متوفر عبر الانترنت",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Divider(),
                  SizedBox(height: 10.h),
                  SizedBox(height: 8.h),
                  Row(
                    children: [
                      Text(
                        'التوافر',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.right,
                      ),

                      Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff14C8C7),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.w,
                            vertical: 10.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          'إضافة',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Divider(),
                  SizedBox(height: 25.h),
                  ConsultationMethodScreen(),
                  SizedBox(height: 10.h),
                  Divider(),
                  TimeSelectorOnline(user: user),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, color: AppColors.mainColor),
                          SizedBox(width: 4),
                          Text(
                            'المدة الزمنية1س',
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.mainColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CustomPriceScreen(price: user.examenPrice.toDouble()),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: DefaultButton(
                        width: 258,

                        text: "إعادة تعيين",

                        backgroundColor: Colors.white,

                        textColor: AppColors.mainColor,
                        function: () {},
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Center(
                    child: DefaultButton(
                      text: "حفظ",
                      width: 258,
                      backgroundColor: Color(0xff14C8C7),

                      textColor: Colors.white,
                      function: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ConsultationMethodScreen extends StatefulWidget {
  const ConsultationMethodScreen({super.key});

  @override
  State<ConsultationMethodScreen> createState() =>
      _ConsultationMethodScreenState();
}

class _ConsultationMethodScreenState extends State<ConsultationMethodScreen> {
  bool phoneCourt = true;
  bool creative = true;
  bool inbox = false;
  bool chat = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'طريقة الاستشارة',
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
                Icon(Icons.delete, color: AppColors.mainColor),
              ],
            ),
          ),
          SizedBox(height: 16.h),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildOption(
                  label: 'مكالمة هاتفية',
                  icon: Icons.call,
                  value: phoneCourt,
                  onChanged: (val) => setState(() => phoneCourt = val),
                ),
                _buildOption(
                  label: 'فيديو',
                  icon: Icons.call,
                  value: creative,
                  onChanged: (val) => setState(() => creative = val),
                ),
                _buildOption(
                  label: 'دردشة',
                  icon: Icons.chat_bubble_outline,
                  value: chat,
                  onChanged: (val) => setState(() => chat = val),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOption({
    required String label,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      width: 150.w,
      height: 50.h,

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        children: [
          Icon(icon, size: 17, color: AppColors.mainColor),
          SizedBox(width: 2.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 10.sp),
          ),

          Transform.scale(
            scale: 0.7,
            child: Switch(
              value: value,
              onChanged: onChanged,
              activeColor: AppColors.mainColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}

class TimeSelectorOnline extends StatefulWidget {
  final LoginModel user;

  const TimeSelectorOnline({super.key, required this.user});

  @override
  _TimeSelectorOnlineState createState() => _TimeSelectorOnlineState();
}

class _TimeSelectorOnlineState extends State<TimeSelectorOnline> {
  String? startDate, endDate, timeSession;
  bool isDateSelected = false;
  static const Map<String, String> days = {
    'س': 'Sunday',
    'ج': 'Monday',
    'خ': 'Tuesday',
    'ر': 'Wednesday',
    'ث': 'Thursday',
    'ن': 'Friday',
    'ح': 'Saturday',
  };
  final List<String> times = List.generate(24, (index) {
    final hour = index;
    return '${hour.toString().padLeft(2, '0')}:00';
  });

  final List<String> durations = [
    '15 دقيقة',
    '20 دقيقة',
    '45 دقيقة',
    '60 دقيقة',
  ];

  late String startTime;
  late String endTime;
  late String selectedMoney;
  late String selectedDuration;
  late Set<String> selectedDays;

  @override
  void initState() {
    super.initState();
    startTime = times[18]; // 18:00 => 6:00 PM
    endTime = times[20]; // 20:00 => 8:00 PM
    selectedMoney = '';
    selectedDuration = durations.first;
    selectedDays = {'س', 'ث'};
  }

  String convertToAmPm(String time24) {
    final parts = time24.split(':');
    int hour = int.parse(parts[0]);
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';

    if (hour == 0) {
      hour = 12;
    } else if (hour > 12) {
      hour -= 12;
    }

    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(Icons.delete, color: AppColors.mainColor),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:
              days.entries.map((day) {
                final bool isSelected = selectedDays.contains(day.key);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedDays.remove(day.key);
                        } else {
                          selectedDays.add(day.key);
                          isDateSelected = true;
                          if (isDateSelected) {
                            if (startDate != null &&
                                endDate != null &&
                                timeSession != null) {
                              /// cubit
                              context.read<AddAvailabilityCubit>().addDay(
                                DayAvailability(
                                  startTime: '',
                                  endTime: '',
                                  consultationDurationMinutes: 0,
                                  consultationPrice: 0,
                                ),
                                day.value,
                              );
                              startDate = endDate = timeSession = null;
                              isDateSelected = false;
                            } else {
                              if (startDate == null) {
                                Text("Please select a start date");
                              } else if (endDate == null) {
                                Text("Please select an end date");
                              } else if (timeSession == null) {
                                Text("Please select a time session");
                              }
                            }
                          }
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor:
                          isSelected ? AppColors.mainColor : Colors.white,
                      child: Text(
                        day.key,
                        style: TextStyle(
                          color:
                              isSelected ? Colors.white : AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDropdown(
              value: startTime,
              items: times,
              displayConverter: convertToAmPm,
              onChanged: (val) {
                setState(() {
                  startTime = val!;
                  debugPrint(startTime);
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('-', style: TextStyle(fontSize: 18)),
            ),
            _buildDropdown(
              value: endTime,
              items: times,
              displayConverter: convertToAmPm,
              onChanged: (val) {
                setState(() {
                  endTime = val!;
                });
              },
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildDropdown(
              value: selectedDuration,
              items: durations,
              onChanged: (val) {
                setState(() {
                  selectedDuration = val!;
                });
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('-', style: TextStyle(fontSize: 18)),
            ),
            CustomPrice(user: widget.user),
          ],
        ),
      ],
    );
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String Function(String)? displayConverter,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey[300],
        child: DropdownButton<String>(
          isExpanded: true,
          underline: SizedBox(),
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.mainColor,
            size: 35,
          ),
          value: value ?? 'Select Time',
          hint: value == null ? Text('Select Time') : Text(value),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem(
                      value: item,
                      onTap:
                          () => setState(() {
                            onChanged(item);
                          }),
                      child: Text(
                        displayConverter != null
                            ? displayConverter(item)
                            : item,
                      ),
                    ),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
