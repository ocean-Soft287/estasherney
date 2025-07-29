import 'dart:ui';

import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderSelectorWidget extends StatefulWidget {
  final String selectedGender;
  final ValueChanged<String> onGenderSelected;

  const GenderSelectorWidget({
    required this.selectedGender,
    required this.onGenderSelected,
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _GenderSelectorWidgetState createState() => _GenderSelectorWidgetState();
}

class _GenderSelectorWidgetState extends State<GenderSelectorWidget> {
  late String _gender;

  @override
  void initState() {
    super.initState();
    _gender = widget.selectedGender;
  }

  void _selectGender(String gender) {
    setState(() {
      _gender = gender;
    });
    widget.onGenderSelected(gender);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "النوع",
          style: GoogleFonts.leagueSpartan(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.mainColor,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(child: GenderChip(label: "ذكر", isSelected: _gender == "ذكر", onTap: () => _selectGender("ذكر"))),
            SizedBox(width: 12.w),
            Expanded(child: GenderChip(label: "أنثى", isSelected: _gender == "أنثى", onTap: () => _selectGender("أنثى"))),
          ],
        ),
      ],
    );
  }
}

class GenderChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 40.h,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20.r),
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? AppColors.mainColor : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(
                color: isSelected ? AppColors.mainColor : Colors.grey.shade300,
              ),
            ),
            child: Center(
              child: Text(
                label,
                style: GoogleFonts.leagueSpartan(
                  color: isSelected ? Colors.white : Colors.black87,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
