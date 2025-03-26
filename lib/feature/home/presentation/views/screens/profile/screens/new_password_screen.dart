import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasswordScreen extends StatefulWidget {
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  bool oldPasswordVisible = false;
  bool newPasswordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 80.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: AppColors.blueGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "مدير كلمة المرور",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 48.w),
                  ],
                ),
              ),
      
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.only(right: 20.w, top: 5.h),
                child: Text(
                  " كلمة المرور الحالية ",
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 4),
      
              buildPasswordField("  ************", oldPasswordVisible, () {
                setState(() {
                  oldPasswordVisible = !oldPasswordVisible;
                });
              }),
      
              Padding(
                padding: EdgeInsets.only(right: 20.w, top: 5.h),
                child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    "نسيت كلمة السر؟",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(right: 20.w, top: 5.h),
                child: Text(
                  "  كلمه السر الجديده  ",
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
      
              buildPasswordField("***********", newPasswordVisible, () {
                setState(() {
                  newPasswordVisible = !newPasswordVisible;
                });
              }),
              Padding(
                padding: EdgeInsets.only(right: 20.w, top: 5.h),
                child: Text(
                  "  تاكيد كلمه السر  ",
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.blackColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
      
              buildPasswordField("  *************", confirmPasswordVisible, () {
                setState(() {
                  confirmPasswordVisible = !confirmPasswordVisible;
                });
              }),
      
              SizedBox(height: 30.h),
      
              Center(
                child: DefaultButton(text: "تغيير كلمة المرور", function: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPasswordField(
    String label,
    bool isVisible,
    VoidCallback toggleVisibility,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
      child: TextField(
        textAlign: TextAlign.right,
        obscureText: !isVisible,
        decoration: InputDecoration(
          fillColor: Colors.white,

          hintText: label,
          labelStyle: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
          suffixIcon: IconButton(
            icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: toggleVisibility,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.r)),
        ),
      ),
    );
  }
}
