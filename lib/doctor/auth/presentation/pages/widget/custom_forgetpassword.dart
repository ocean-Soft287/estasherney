import 'package:consult_me/doctor/auth/presentation/pages/forgetpassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:consult_me/core/constants/app_colors.dart';

class CustomForgetpassword extends StatelessWidget {
  const CustomForgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ForgetPasswordScreen()),
        );
      },
      child: Text(
        'نسيت كلمة السر؟',
        style: GoogleFonts.leagueSpartan(
          fontSize: 14.sp,
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}
