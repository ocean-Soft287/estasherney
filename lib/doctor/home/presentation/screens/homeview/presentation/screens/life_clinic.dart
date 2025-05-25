import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LifeClinic extends StatelessWidget {
  const LifeClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
                  SizedBox(width: 100.w),
                  Text(
                    "عيادة الحياة",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Divider(),
              SizedBox(height: 30.h),
              ProductCard(),
              SizedBox(height: 20.h),
              Divider(),
              SizedBox(height: 10.h),
              TimeSelectorWidget(),
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
    );
  }
}

class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  String selectedValue = '800 د.ل';
  final List<String> items = ['800 د.ل', '600 د.ل', '400 د.ل'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: selectedValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.mainColor,
                size: 35,
              ),
              items:
                  items.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, textDirection: TextDirection.rtl),
                    );
                  }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.savings, size: 18, color: AppColors.mainColor),
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
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
      ],
    );
  }
}

class TimeSelectorWidget extends StatefulWidget {
  @override
  _TimeSelectorWidgetState createState() => _TimeSelectorWidgetState();
}

class _TimeSelectorWidgetState extends State<TimeSelectorWidget> {
  final List<String> days = ['س', 'ج', 'خ', 'ر', 'ث', 'ن', 'ح'];
  final List<String> times = ['8:00 م', '7:00 م', '6:00 م', '5:00 م', '4:00 م'];
  final List<String> durations = ['30 دقيقة', '45 دقيقة', '60 دقيقة'];

  String startTime = '8:00 م';
  String endTime = '4:00 م';
  String selectedDuration = '30 دقيقة';
  Set<String> selectedDays = {'ل', 'ث'};

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
            Expanded(
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
                  value: startTime,
                  items:
                      times
                          .map(
                            (time) => DropdownMenuItem(
                              value: time,
                              child: Text(time),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      startTime = val!;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text('-', style: TextStyle(fontSize: 18)),
            ),
            Expanded(
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
                  value: endTime,
                  items:
                      times
                          .map(
                            (time) => DropdownMenuItem(
                              value: time,
                              child: Text(time),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      endTime = val!;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
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
                  value: selectedDuration,
                  items:
                      durations
                          .map(
                            (d) => DropdownMenuItem(value: d, child: Text(d)),
                          )
                          .toList(),
                  onChanged: (val) {
                    setState(() {
                      selectedDuration = val!;
                    });
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(
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
            ),
          ],
        ),
      ],
    );
  }
}
