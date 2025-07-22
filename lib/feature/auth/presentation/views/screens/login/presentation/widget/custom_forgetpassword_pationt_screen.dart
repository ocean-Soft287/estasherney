import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/screens/forgetpassword_pationt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomForgetpasswordPationtScreen extends StatelessWidget {
  const CustomForgetpasswordPationtScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ForgetpasswordPationtScreen()),
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
