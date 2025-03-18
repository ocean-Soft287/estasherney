import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/intial/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Image.asset("assets/images/ChooseYourDoctor .png"),
            SizedBox(height: 50.h),
            Text(
              "اختر طبيبك",
              style: GoogleFonts.leagueSpartan(
                color: AppColors.mainColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 25.h),
            Align(
              alignment: Alignment.centerRight,
              
              child: Text(
                "   يمكنك تصفح قائمة الأطباء المتخصصين، قراءة التقييمات، "
                " وحجز موعدك بسهولة تامة. صحتك تستحق الأفضل",
                style: GoogleFonts.leagueSpartan(
                  color: AppColors.textcColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w300,
                
                ),
                textAlign:TextAlign.right ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
