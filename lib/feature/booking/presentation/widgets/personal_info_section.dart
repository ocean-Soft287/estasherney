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
final TextEditingController nameController;
final TextEditingController ageController;
final TextEditingController problemController;
  final ValueChanged<String> onProblemChanged;
  final ValueChanged<String> onGenderSelected;

final GlobalKey<FormState> formKey ;
  const PersonalInfoSection({
    super.key,
    required this.fullName,
    required this.formKey,
    required this.age,
    required this.problemDescription,
    required this.selectedGender,
    required this.onProblemChanged,
    required this.onGenderSelected, required this.nameController, required this.ageController, required this.problemController,
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
            hintText: " ادخل اسمك", controller: nameController,
          ),
          SizedBox(height: 16.h),
          InputField(
            label: "العمر",
            hintText: "ادخل عمرك",
            keyboardType: TextInputType.number, controller: ageController,
          ),
          SizedBox(height: 16.h),
          GenderSelectorWidget(
            selectedGender: selectedGender,
            onGenderSelected: onGenderSelected,
          ),
          SizedBox(height: 16.h),
          InputField(
            controller: problemController,
            label: "وصف المشكلة",
            hintText: "اكتب المشكلة هنا...",
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}

