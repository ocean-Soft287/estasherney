import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> with SingleTickerProviderStateMixin {
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
      begin: const Offset(-1.0, 0.0), // Slide from left
      end: Offset.zero, // End at original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Reset and restart the animation every time the screen is displayed
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                            ' تعيين كلمة المرور',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Icon(Icons.arrow_back_ios, color: Colors.white),
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
                            ' كلمه السر',
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
                          hintText: '  ........  ',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: Icon(Icons.visibility_off),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: SlideTransition(
                          position: _slideAnimation,
                          child: Text(
                            ' تاكيد كلمه السر',
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
                      SizedBox(height: 40.h),
                      DefaultButton(
                        text: " إنشاء كلمة مرور جديدة",
                        function: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
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