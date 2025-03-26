import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
           
            Container(
              width: double.infinity,
              height: 80.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "سياسة الخصوصية",
                        style: GoogleFonts.leagueSpartan(
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 40.w),
                ],
              ),
            ),

         
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  
                    Text(
                      "آخر تحديث: 14/08/2024",
                      style: _textStyle(12.sp, FontWeight.w500, Colors.grey),
                    ),
                    SizedBox(height: 10.h),

                  
                    Text(
                      "سياسة الخصوصية",
                      style: _textStyle(18.sp, FontWeight.bold, Colors.grey),
                    ),
                    SizedBox(height: 8.h),

                    _buildParagraph(
                      "نحن في [اسم التطبيق] نحترم خصوصيتك ونسعى لحماية بياناتك الشخصية. "
                      "تشرح سياسة الخصوصية هذه كيفية جمع المعلومات الشخصية وكيفية استخدامها للحفاظ على بياناتك.",
                    ),

                    _buildBulletPoint(
                      "جمع المعلومات المختلفة مثل بيانات الحساب.",
                    ),
                    _buildBulletPoint(
                      "استخدام البيانات فقط لتحسين تجربة المستخدم.",
                    ),
                    _buildBulletPoint(
                      "ملفات تعريف الارتباط (Cookies) لتحسين تجربة التصفح.",
                    ),

                    SizedBox(height: 20.h),

                
                    Text(
                      "الشروط والأحكام",
                      style: _textStyle(18.sp, FontWeight.bold,AppColors.mainColor),
                    ),
                    SizedBox(height: 8.h),

                    _buildNumberedList([
                      "جمع المعلومات الشخصية.",
                      "استخدام المعلومات في تحسين خدمات التطبيق.",
                      "عدم مشاركة المعلومات مع أطراف غير مرخصة.",
                      "يجب على المستخدم الموافقة على جميع الشروط.",
                      "اتخاذ التدابير لحماية البيانات الشخصية.",
                      "التطبيق غير مسؤول عن إساءة استخدام الحساب.",
                    ]),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  TextStyle _textStyle(double size, FontWeight weight, Color color) {
    return GoogleFonts.leagueSpartan(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

 
  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: _textStyle(14.sp, FontWeight.w400, Colors.black87),
      textAlign: TextAlign.right,
    );
  }

  
  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: _textStyle(16.sp, FontWeight.w500, Colors.black)),
          Expanded(
            child: Text(
              text,
              style: _textStyle(14.sp, FontWeight.w400, Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

 
  Widget _buildNumberedList(List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(items.length, (index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${index + 1}. ",
                style: _textStyle(14.sp, FontWeight.bold, Colors.grey),
              ),
              Expanded(
                child: Text(
                  items[index],
                  style: _textStyle(14.sp, FontWeight.w400, Colors.black87),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
