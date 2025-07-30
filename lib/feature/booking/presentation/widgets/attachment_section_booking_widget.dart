import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/booking/presentation/screens/booking_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AttachmentsSectionWidget extends StatelessWidget {
  final VoidCallback onFileTap;
  final VoidCallback onImageTap;

  const AttachmentsSectionWidget({
    required this.onFileTap,
    required this.onImageTap,
    super.key,
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
      child: Row(
        children: [
          Expanded(
            child: AttachmentButton(
              icon: Icons.attach_file_rounded,
              text: "إضافة ملفات",
              onTap: onFileTap,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: AttachmentButton(
              icon: Icons.image_rounded,
              text: "إضافة صورة",
              onTap: onImageTap,
            ),
          ),
        ],
      ),
    );
  }
}

class AttachmentButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const AttachmentButton({
    required this.icon,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: AppColors.mainColor, size: 24.w),
              SizedBox(height: 4.h),
              Text(
                text,
                style: GoogleFonts.leagueSpartan(
                  color: Colors.black87,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
