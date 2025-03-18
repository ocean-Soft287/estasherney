import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/login_screen.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/register/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/images/logo.png"),
              Image.asset("assets/images/image_two.png"),
              SizedBox(height: 40.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "صحتك أولويتنا، وراحتك هدفنا. نحن هنا لمساعدتك في رحلتك نحو حياة أكثر صحة وسعادة",
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.mainColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultButton(
                  text: "تسجيل الدخول",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultButton(
                  text: "انشاء حساب ",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultButton(text: " الدخول كزائر ", function: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
