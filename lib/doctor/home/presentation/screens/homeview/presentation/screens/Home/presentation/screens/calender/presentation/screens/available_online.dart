import 'package:consult_me/core/Network/local/sharedprefrences.dart';
import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/data/models/post_available_request.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/logic/availabledoctor/doctor_availble_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/logic/availabledoctor/doctor_availble_state.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/widget/custom_price_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableOnline extends StatefulWidget {
  final LoginModel user;
  const AvailableOnline({super.key, required this.user});

  @override
  State<AvailableOnline> createState() => _AvailableOnlineState();
}

class _AvailableOnlineState extends State<AvailableOnline> {
  final GlobalKey<_TimeSelectorOnlineState> timeSelectorKey = GlobalKey();
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
                  Row(
                    children: [
                      Text(
                        'التوافر',
                        style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      // Spacer(),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Color(0xff14C8C7),
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: 20.w,
                      //       vertical: 10.h,
                      //     ),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(8.r),
                      //     ),
                      //   ),
                      //   onPressed: () {},
                      //   child: Text(
                      //     'إضافة',
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 14.sp,
                      //     ),
                      //   ),
                      // ),
               
                    ],
                  ),
              
                  SizedBox(height: 10.h),
              //    Divider(),
            //      SizedBox(height: 25.h),
                 // ConsultationMethodScreen(),
                //  SizedBox(height: 10.h),
              //    Divider(),
                  TimeSelectorOnline(
                    key: timeSelectorKey,
                    user: widget.user,
                    onTimeChanged: () {
                      setState(() {});
                    },
                  ),

                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, color: AppColors.mainColor),
                          SizedBox(width: 4),
                          Text(
                            'المدة الزمنية: ${timeSelectorKey.currentState?.calculateDurationInMinutes() ?? 'غير محددة'} دقيقة',

                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.mainColor,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      CustomPriceScreen(
                        price: widget.user.examenPrice.toDouble(),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  BlocConsumer<AddAvailabilityCubit, AddAvailabilityState>(
                    listener: (context, state) {
                      if (state is AddAvailabilitySuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('تم حفظ التوافر بنجاح')),
                        );
                        Navigator.of(context).pop();
                      } else if (state is AddAvailabilityFailure) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.error)));
                      }
                    },
                    builder: (context, state) {
                      final cubit = context.read<AddAvailabilityCubit>();
                      final selectorState = timeSelectorKey.currentState;

                      return Column(
                        children: [
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: DefaultButton(
                                width: 258,
                                text: "إعادة تعيين",
                                backgroundColor: Colors.white,
                                textColor: AppColors.mainColor,
                                function: () {
                                  cubit.weeklyAvailability.days.clear();
                                  selectorState?.resetAll();

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("تمت إعادة التعيين"),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Center(
                            child:
                                state is AddAvailabilityLoading
                                    ? const CircularProgressIndicator(
                                      color: Color(0xff14C8C7),
                                    )
                                    : DefaultButton(
                                      text: "حفظ",
                                      width: 258,
                                      backgroundColor: const Color(0xff14C8C7),
                                      textColor: Colors.white,
                                      function: () {
                                        if (selectorState != null) {
                                          final saved =
                                              selectorState.getSavedDays();

                                          if (saved.isEmpty) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "يرجى إضافة توافر ليوم واحد على الأقل",
                                                ),
                                              ),
                                            );
                                          } else if (!selectorState
                                                  .isCallSelected &&
                                              !selectorState.isVideoSelected) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "يرجى اختيار نوع الاستشارة: فيديو أو مكالمة",
                                                ),
                                              ),
                                            );
                                          } else {
                                           final previousDate   =   CacheHelper.getData(key: 'previousday');
                                           final startDate =  DateTime.now();
                                          final endDate =  DateTime.now().add(
                                                Duration(days: 7),
                                              );
                                      
                                           if(previousDate != null){
                                           DateTime previousDay = DateTime.parse(previousDate);
                                               
                                                if(previousDay.isBefore(startDate)){
                                               
                                                add_appointment(cubit, saved, startDate, endDate, selectorState);

                                                }else {
                                                  ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(content: Text('هذا الاسبوع محجوز من قبل حتي يوم ${previousDay.day}-${previousDay.month}-${previousDay.year}')),
                                                  );
                                                }

                                           }else {
                                            add_appointment(cubit, saved, startDate, endDate, selectorState);

                                           }
                                       
                                          }
                                        }
                                      },
                                    ),
                          ),
                          SizedBox(height: 30.h),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void add_appointment(AddAvailabilityCubit cubit, Map<String, DayAvailability> saved, DateTime startDate, DateTime endDate, _TimeSelectorOnlineState selectorState) {
         cubit.weeklyAvailability.days
        .clear();
    cubit.weeklyAvailability.days
    
        .addAll(saved);
                                   
    
    final schedule = Schedule(
      startDate: startDate,
      endDate:endDate ,
      weeklyAvailability:
          cubit.weeklyAvailability,
      availableConsultationTypes:
          selectorState
              .getSelectedConsultationType(),
    );
    
    debugPrint(
      "Request JSON: ${schedule.toJson()}",
    );
    cubit.addAvailability(schedule);
                                           
  }
}

// class ConsultationMethodScreen extends StatelessWidget {
//   const ConsultationMethodScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final methods = [
//       {'label': 'مكالمة هاتفية', 'icon': Icons.call},
//       {'label': 'فيديو', 'icon': Icons.videocam},
//     ];

//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 12.w),
//             child:
//              Text(
//               'طريقة الاستشارة',
//               style: GoogleFonts.leagueSpartan(
//                 fontSize: 16.sp,
//                 fontWeight: FontWeight.bold,
//                 color: AppColors.mainColor,
//               ),
//             ),
       
//           ),
//           SizedBox(height: 16.h),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children:
//                   methods.map((method) {
//                     return Container(
//                       width: 150.w,
//                       height: 50.h,
//                       margin: EdgeInsets.symmetric(horizontal: 4.w),
//                       padding: EdgeInsets.symmetric(horizontal: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12.r),
//                         color: AppColors.mainColor.withOpacity(0.1),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(
//                             method['icon'] as IconData,
//                             size: 18,
//                             color: AppColors.mainColor,
//                           ),
//                           SizedBox(width: 6),
//                           Text(
//                             method['label'] as String,
//                             style: TextStyle(fontSize: 12.sp),
//                           ),
//                           Spacer(),
//                           Icon(
//                             Icons.check_circle,
//                             color: AppColors.mainColor,
//                             size: 20,
//                           ),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

Widget _buildOption({
  required String label,
  required IconData icon,
  required bool value,
  required ValueChanged<bool> onChanged,
}) {
  return Container(
    width: 150.w,
    height: 50.h,

    margin: EdgeInsets.symmetric(horizontal: 4.w),
    padding: EdgeInsets.symmetric(horizontal: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.r),
      color: AppColors.mainColor.withOpacity(0.1),
    ),
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

class TimeSelectorOnline extends StatefulWidget {
  final LoginModel user;
  final VoidCallback? onTimeChanged;

  const TimeSelectorOnline({super.key, required this.user, this.onTimeChanged});

  @override
  _TimeSelectorOnlineState createState() => _TimeSelectorOnlineState();
}

class _TimeSelectorOnlineState extends State<TimeSelectorOnline> {
  final Map<String, String> days = {
    'س': 'Sunday',
    'ج': 'Monday',
    'خ': 'Tuesday',
    'ر': 'Wednesday',
    'ث': 'Thursday',
    'ن': 'Friday',
    'ح': 'Saturday',
  };

  final List<String> times = List.generate(
    24,
    (index) => '${index.toString().padLeft(2, '0')}:00',
  );
  final List<String> durations = [
    '15 دقيقة',
    '20 دقيقة',
    '45 دقيقة',
    '60 دقيقة',
  ];

  String? selectedDayKey;
  String? startTime;
  String? endTime;
  String? selectedDuration;
  bool isCallSelected = false;
  bool isVideoSelected = false;

  final Map<String, Map<String, String>> selectedDaysData = {};

  void resetAll() {
    setState(() {
      selectedDaysData.clear();
      selectedDayKey = null;
      startTime = null;
      endTime = null;
      selectedDuration = null;
      isCallSelected = false;
      isVideoSelected = false;
    });
  }

  Map<String, DayAvailability> getSavedDays() {
    final Map<String, DayAvailability> result = {};
    selectedDaysData.forEach((arabicKey, values) {
      final englishDay = days[arabicKey]!;
      result[englishDay] = DayAvailability(
        startTime: values['startTime']!,
        endTime: values['endTime']!,
        consultationDurationMinutes: _durationToInt(values['duration']!),
        consultationPrice: widget.user.examenPrice.toDouble(),
      );
    });
    return result;
  }

  List<String> getSelectedConsultationType() {
    List<String> result = ['Chat'];
    if (isCallSelected) {
      result.add('Call');
    } else if (isVideoSelected) {
      result.add('Video');
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children:
              days.entries.map((day) {
                final isSelected = selectedDayKey == day.key;
                final isFilled = selectedDaysData.containsKey(day.key);

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: InkWell(
                    onTap: () {
                      if (!_validateCurrentDayInputs()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'وقت النهاية يجب أن يكون بعد وقت البداية',
                            ),
                          ),
                        );
                        return;
                      }

                      setState(() {
                        selectedDayKey = day.key;
                        if (isFilled) {
                          final existing = selectedDaysData[day.key]!;
                          startTime = existing['startTime'];
                          endTime = existing['endTime'];
                          selectedDuration = existing['duration'];
                        } else {
                          startTime = null;
                          endTime = null;
                          selectedDuration = null;
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor:
                          isFilled
                              ? Colors.green
                              : isSelected
                              ? AppColors.mainColor
                              : Colors.white,
                      child: Text(
                        day.key,
                        style: TextStyle(
                          color:
                              isFilled || isSelected
                                  ? Colors.white
                                  : AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
        ),
        SizedBox(height: 16),
        if (selectedDayKey != null)
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildDropdown(
                    value: startTime,
                    items: times,
                    onChanged:
                        (val) => setState(() {
                          startTime = val;
                          _autoSaveDay();
                          widget.onTimeChanged?.call();
                        }),
                    hint: 'وقت البداية',
                    displayConverter: _convertToAmPm,
                  ),
                  Text('-', style: TextStyle(fontSize: 18)),
                  _buildDropdown(
                    value: endTime,
                    items: times,
                    onChanged:
                        (val) => setState(() {
                          endTime = val;
                          _autoSaveDay();
                          widget.onTimeChanged?.call();
                        }),
                    hint: 'وقت النهاية',
                    displayConverter: _convertToAmPm,
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
                    onChanged:
                        (val) => setState(() {
                          selectedDuration = val;
                          _autoSaveDay();
                          widget.onTimeChanged?.call();
                        }),
                    hint: 'المدة الزمنية',
                  ),
                  Text('-', style: TextStyle(fontSize: 18)),
                  Text(
                    "السعر: ${widget.user.examenPrice} ج.م",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.mainColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                                    'طريقة الاستشارة',
                                    style: GoogleFonts.leagueSpartan(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                    SizedBox(height: 14),
       
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                      _buildOption(
                        label: 'مكالمة',
                        icon: Icons.call,
                        value: isCallSelected,
                        onChanged: (val) {
                          setState(() {
                            isCallSelected = val;
                            if (val) isVideoSelected = false;
                          });
                        },
                      ),
                      _buildOption(
                        label: 'فيديو',
                        icon: Icons.videocam,
                        value: isVideoSelected,
                        onChanged: (val) {
                          setState(() {
                            isVideoSelected = val;
                            if (val) isCallSelected = false;
                          });
                        },
                      ),
                                      ],
                                    ),
                    ],
                  ),
           
            ],
          ),
      ],
    );
  }

  void _autoSaveDay() {
    if (selectedDayKey != null &&
        startTime != null &&
        endTime != null &&
        selectedDuration != null) {
      final start = int.tryParse(startTime!.split(":").first) ?? 0;
      final end = int.tryParse(endTime!.split(":").first) ?? 0;

      if (end <= start) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('وقت النهاية يجب أن يكون بعد وقت البداية')),
        );
        return;
      }

      selectedDaysData[selectedDayKey!] = {
        'startTime': startTime!,
        'endTime': endTime!,
        'duration': selectedDuration!,
      };
    }
  }

  bool _validateCurrentDayInputs() {
    if (startTime == null || endTime == null) return true;
    final start = int.tryParse(startTime!.split(":").first) ?? 0;
    final end = int.tryParse(endTime!.split(":").first) ?? 0;
    return end > start;
  }

  int _durationToInt(String durationText) {
    return int.tryParse(durationText.split(' ').first) ?? 15;
  }

  String _convertToAmPm(String time24) {
    final parts = time24.split(':');
    int hour = int.parse(parts[0]);
    final minute = parts[1];
    final period = hour >= 12 ? 'PM' : 'AM';
    if (hour == 0) {
      hour = 12;
    } else if (hour > 12)
      hour -= 12;
    return '$hour:$minute $period';
  }

  int? calculateDurationInMinutes() {
    if (startTime == null || endTime == null) return null;
    final startHour = int.tryParse(startTime!.split(":")[0]) ?? 0;
    final endHour = int.tryParse(endTime!.split(":")[0]) ?? 0;

    final duration = (endHour - startHour) * 60;
    return duration > 0 ? duration : null;
  }

  Widget _buildDropdown({
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    String? hint,
    String Function(String)? displayConverter,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.grey[300],
        child: DropdownButton<String>(
          isExpanded: true,
          underline: SizedBox(),
          hint: Text(hint ?? ''),
          value: value,
          icon: Icon(Icons.keyboard_arrow_down, color: AppColors.mainColor),
          items:
              items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    displayConverter != null ? displayConverter(item) : item,
                  ),
                );
              }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
