import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/core/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDoctorScreen extends StatefulWidget {
  const ProfileDoctorScreen({super.key});

  @override
  State<ProfileDoctorScreen> createState() => _ProfileDoctorScreenState();
}

class _ProfileDoctorScreenState extends State<ProfileDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.mainColor,
                      ),
                    ),
                    SizedBox(width: 80.w),
                    Text(
                      'الملف الشخصي',
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                      ),
                    ),
                    Spacer(),
                    Image.asset("assets/images/Group 111.png"),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.all(13),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColors.mainColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Image.asset("assets/images/DrAva.png")),
                        SizedBox(height: 20.h),
                        Text(
                          'الإسم',
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          hintText: "سهام",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'الكنية',
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          hintText: "عمر خالد",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'رقم الهاتف',
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          hintText: "+218911057016",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'رقم الترخيص',
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          hintText: "211",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'تاريخ الميلاد',
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          hintText: "1980-1-11",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: 10.h),
                        GenderSelector(),
                        SizedBox(height: 10.h),
                        Text(
                          'البلد',
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          hintText: "مصر",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'المحافظة ',
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          hintText: "الجيزة",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'العنوان بالتفصيل',
                          style: GoogleFonts.leagueSpartan(
                            color: AppColors.mainColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        CustomTextFormField(
                          hintText: "",
                          textInputType: TextInputType.text,
                        ),
                        SizedBox(height: 20.h),
                        Center(
                          child: DefaultButton(
                            function: () {},
                            width: 200.w,
                            heightButton: 50.h,

                            text: "حفظ",
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GenderSelector extends StatefulWidget {
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String selectedGender = 'أنثى';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.cyan, width: 2),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:
            ['ذكر', 'أنثى'].map((gender) {
              final bool isSelected = gender == selectedGender;

              return Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedGender = gender;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? Color(0xff3A3BAE) : Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        gender,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Color(0xff3A3BAE),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
      ),
    );
  }
}
