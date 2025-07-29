import 'package:consult_me/feature/booking/presentation/screens/booking_page.dart';
import 'package:consult_me/feature/booking/presentation/widgets/patient_type_button.dart';
import 'package:consult_me/feature/booking/presentation/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientDetailsSection extends StatelessWidget {
  final bool isSelfSelected;
  final void Function(bool) onSelectionChanged;

  const PatientDetailsSection({
    super.key,
    required this.isSelfSelected,
    required this.onSelectionChanged,
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
          const SectionTitle(title: "تفاصيل المريض"),
          SizedBox(height: 16.h),
          Row(
            children: [
              PatientTypeButton(
                text: "نفسك",
                isSelected: isSelfSelected,
                onPressed: () => onSelectionChanged(true),
              ),
              SizedBox(width: 12.w),
              PatientTypeButton(
                text: "شخص آخر",
                isSelected: !isSelfSelected,
                onPressed: () => onSelectionChanged(false),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
