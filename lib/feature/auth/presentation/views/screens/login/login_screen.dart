import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/new_password/new_password.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/privacy/page_one_privacy.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/register/register_screen.dart';
import 'package:consult_me/feature/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), 
      end: Offset.zero, 
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
   
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                    left: 20,
                    right: 20,
                  ),
                  width: double.infinity,
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: AppColors.blueGradient,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Center(
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            'تسجيل دخول',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(0.3),
                                  offset: Offset(1, 1),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            'مرحبا',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            'سجّل دخولك  للوصول إلى خدماتك الصحية بكل سهولة وأمان. صحتك تبدأ هنا',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 14,
                              color: AppColors.greyColor,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            'البريد الإلكتروني أو رقم الجوال',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: '  ahmed12@gamil.com  ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            'كلمه السر',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey[200],
                          hintText: ' ........',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: Text(
                              ' نسيت كلمه السر',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.greyColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      DefaultButton(
                        text: "تسجيل الدخول",
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PageOnePrivacy(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 100.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterScreen(),
                                ),
                              );
                            },
                            child: SlideTransition(
                              position: _slideAnimation,
                              child: Text(
                                "سجل الآن",
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ),
                          ),
                          SlideTransition(
                            position: _slideAnimation,
                            child: Text(
                              "ليس لديك حساب؟",
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w300,
                                color: AppColors.greyColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}