import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/constants/images_svg.dart';

class ConfirmationWidget extends StatelessWidget {
  const ConfirmationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        SvgPicture.asset(ImagesSvg.confirm),
        SizedBox(height: 10.h),
        Text(
          "تهانينا",
          style: TextStyle(
            fontFamily: Appfonts.font,
            fontWeight: FontWeight.w600,
            fontSize: 40.sp,
            color: AppColors.mainColor,
          ),
        ),
        Text(
          "تم الدفع بنجاح",
          style: TextStyle(
            fontFamily: Appfonts.font,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
            color: AppColors.brown,
          ),
        ),
        SizedBox(height: 20.h),
        _buildPaymentInfoBox(context),
        SizedBox(height: 10.h),
        _buildDownloadReceiptButton(context),
      ],
    );
  }

  Widget _buildPaymentInfoBox(BuildContext context) {
    return Container(
      width: 0.9*MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.11),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "تم الدفع بنجاح",
            style: TextStyle(
              fontFamily: Appfonts.font,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: AppColors.brown,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "د/ محمد فتحي",
            style: TextStyle(
              fontFamily: Appfonts.font,
              fontWeight: FontWeight.w700,
              fontSize: 20.sp,
              color: AppColors.brown,
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconText(Icons.calendar_month, "12/3/2025"),
              _buildIconText(Icons.alarm, "10:00 ص"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: AppColors.mainColor, size: 20.w),
        SizedBox(width: 5.w),
        Text(
          text,
          style: TextStyle(
            color: AppColors.brown,
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildDownloadReceiptButton(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 0.9*MediaQuery.of(context).size.width,
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.11),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(ImagesSvg.download),
          SizedBox(width: 10.w),
          Text(
            "تنزيل الايصال",
            style: TextStyle(
              fontFamily: Appfonts.font,
              fontWeight: FontWeight.w600,
              fontSize: 15.sp,
              color: AppColors.brown,
            ),
          ),
        ],
      ),
    );
  }
}
