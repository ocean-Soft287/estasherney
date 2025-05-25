import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableOnline extends StatelessWidget {
  const AvailableOnline({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(16.0.w),
          child: SingleChildScrollView(
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
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
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
                TimeSelectorOnline(),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.savings,
                          size: 18,
                          color: AppColors.mainColor,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          'تحصل علي ٢٨.٨ د.ل',
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 80.h),
                DefaultButton(
                  width: 258,
                  text: "إعادة تعيين",
                  backgroundColor: Colors.white,

                  textColor: Color(0xff14C8C7),
                  function: () {},
                ),
                SizedBox(height: 30.h),
                DefaultButton(
                  text: "حفظ",
                  width: 258,
                  backgroundColor: Color(0xff14C8C7),

                  textColor: Colors.white,
                  function: () {},
                ),
              ],
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          SizedBox(width: 6.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12.sp),
          ),
          SizedBox(width: 6.h),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.mainColor,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ],
      ),
    );
  }
}

class TimeSelectorOnline extends StatefulWidget {
  @override
  _TimeSelectorOnlineState createState() => _TimeSelectorOnlineState();
}

class _TimeSelectorOnlineState extends State<TimeSelectorOnline> {
  final List<String> days = ['س', 'ج', 'خ', 'ر', 'ث', 'ن', 'ح'];
  final List<String> times = ['8:00 م', '7:00 م', '6:00 م', '5:00 م', '4:00 م'];
  final List<String> durations = ['30 دقيقة', '45 دقيقة', '60 دقيقة'];
  final List<String> money = ['5.00 د.ل', '100.00 د.ل', '200.00 د.ل'];

  String startTime = '8:00 م';
  String endTime = '4:00 م';
  String selectedMoney = '5.00 د.ل';
  String selectedDuration = '30 دقيقة';
  Set<String> selectedDays = {'س', 'ث'};

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
              days.map((day) {
                final bool isSelected = selectedDays.contains(day);
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedDays.remove(day);
                        } else {
                          selectedDays.add(day);
                        }
                      });
                    },
                    child: CircleAvatar(
                      backgroundColor:
                          isSelected ? AppColors.mainColor : Colors.white,
                      child: Text(
                        day,
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
              onChanged: (val) {
                setState(() {
                  startTime = val!;
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
            _buildDropdown(
              value: selectedMoney,
              items: money,
              onChanged: (val) {
                setState(() {
                  selectedMoney = val!;
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  // Helper method to build the dropdowns
  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
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
          value: value,
          items:
              items
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
