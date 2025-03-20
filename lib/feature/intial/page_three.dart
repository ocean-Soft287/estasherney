import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/intial/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth > 600 ? 32.w : 16.w,
                vertical: 16.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Image.asset(
                    "assets/images/CheckYourMedicalHistory.png",
                    width: constraints.maxWidth > 600 ? 400.w : 250.w,
                    height: constraints.maxWidth > 600 ? 400.h : 250.h,
                  ),
                  SizedBox(height: 50.h),
                  Text(
                    "تحقق من تاريخك الطبي ",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: constraints.maxWidth > 600 ? 24.sp : 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      " يمكنك الوصول إلى سجلاتك الطبية ومتابعة تطورات حالتك الصحية في أي وقت ومن أي مكان. صحتك بين يديك",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.textcColor,
                        fontSize: constraints.maxWidth > 600 ? 16.sp : 12.sp,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

