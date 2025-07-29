import 'package:consult_me/feature/booking/presentation/screens/booking_page.dart';
import 'package:consult_me/feature/booking/presentation/widgets/gender_selector.dart';
import 'package:consult_me/feature/booking/presentation/widgets/input_field_booking_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PersonalInfoSection extends StatelessWidget {
  final String fullName;
  final String age;
  final String problemDescription;
  final String selectedGender;
  final ValueChanged<String> onNameChanged;
  final ValueChanged<String> onAgeChanged;
  final ValueChanged<String> onProblemChanged;
  final ValueChanged<String> onGenderSelected;

  const PersonalInfoSection({
    super.key,
    required this.fullName,
    required this.age,
    required this.problemDescription,
    required this.selectedGender,
    required this.onNameChanged,
    required this.onAgeChanged,
    required this.onProblemChanged,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: BookingDesignSystem.sectionPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(BookingDesignSystem.cardRadius.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputField(
            label: "الاسم كامل",
            hintText: "محمد فتحي",
            onChanged: onNameChanged,
          ),
          SizedBox(height: 16.h),
          InputField(
            label: "العمر",
            hintText: "23",
            keyboardType: TextInputType.number,
            onChanged: onAgeChanged,
          ),
          SizedBox(height: 16.h),
          GenderSelectorWidget(
            selectedGender: selectedGender,
            onGenderSelected: onGenderSelected,
          ),
          SizedBox(height: 16.h),
          InputField(
            label: "وصف المشكلة",
            hintText: "اكتب المشكلة هنا...",
            maxLines: 3,
            onChanged: onProblemChanged,
          ),
        ],
      ),
    );
  }
}

