import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/intial/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PageThree extends StatefulWidget {
  
  const PageThree({super.key,});

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> with SingleTickerProviderStateMixin {
  double _opacity = 0.0;
  double _scale = 0.8;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });
  }

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

              
                  AnimatedOpacity(
                    duration: Duration(milliseconds: 800),
                    opacity: _opacity,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeOut,
                      transform: Matrix4.identity()..scale(_scale),
                      child: Image.asset(
                        "assets/images/CheckYourMedicalHistory.png",
                        width: constraints.maxWidth > 600 ? 400.w : 250.w,
                        height: constraints.maxWidth > 600 ? 400.h : 250.h,
                      ),
                    ),
                  ),

                  SizedBox(height: 50.h),

                
                  AnimatedSlide(
                    offset: Offset(_opacity == 1.0 ? 0 : -1.0, 0), // Text slides in from left to right
                    duration: Duration(milliseconds: 800),
                    child: Text(
                      "تحقق من تاريخك الطبي",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: constraints.maxWidth > 600 ? 24.sp : 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(height: 25.h),

                
                  AnimatedSlide(
                    offset: Offset(_opacity == 1.0 ? 0 : -1.0, 0), // Text slides in from left to right
                    duration: Duration(milliseconds: 800),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "يمكنك الوصول إلى سجلاتك الطبية ومتابعة تطورات حالتك الصحية في أي وقت ومن أي مكان. صحتك بين يديك",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.textcColor,
                          fontSize: constraints.maxWidth > 600 ? 16.sp : 12.sp,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.right,
                      ),
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
