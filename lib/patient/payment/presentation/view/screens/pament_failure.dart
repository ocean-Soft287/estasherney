import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentErrorPage extends StatelessWidget {
  const PaymentErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Error Icon with animation effect
              Container(
                width: 120.w,
                height: 120.w,
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.error_outline_rounded,
                  size: 60.sp,
                  color: Colors.red.shade400,
                ),
              ),
              
              SizedBox(height: 32.h),
              
              // Main Error Title
              Text(
                'فشلت العملية',
                style: TextStyle(
                  color: Colors.black87,
                  fontFamily: 'Monadi',
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              
              SizedBox(height: 16.h),
              
              // Error Description Card
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.all(20.w),
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(16.r),
              //     boxShadow: [
              //       BoxShadow(
              //         color: Colors.black.withOpacity(0.05),
              //         blurRadius: 10,
              //         offset: const Offset(0, 4),
              //       ),
              //     ],
              //   ),
              //   child: Column(
              //     children: [
              //       Icon(
              //         Icons.cancel_outlined,
              //         color: Colors.red.shade400,
              //         size: 32.sp,
              //       ),
                    
              //       SizedBox(height: 12.h),
                    
              //       Text(
              //         'تم رفض عملية الدفع',
              //         style: TextStyle(
              //           color: Colors.black87,
              //           fontSize: 18.sp,
              //           fontFamily: 'Monadi',
              //           fontWeight: FontWeight.w600,
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
                    
              //       SizedBox(height: 8.h),
                    
              //       Text(
              //         'يرجى المحاولة مرة أخرى أو التواصل مع خدمة العملاء',
              //         style: TextStyle(
              //           color: Colors.grey.shade600,
              //           fontSize: 14.sp,
              //           fontFamily: 'Monadi',
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //     ],
              //   ),
              // ),
              
              SizedBox(height: 40.h),
              
              // Additional Help Text
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.blue.shade100),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.blue.shade600,
                      size: 20.sp,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        'تأكد من صحة بيانات البطاقة ووجود رصيد كافي',
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: 12.sp,
                          fontFamily: 'Monadi',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      
      // Bottom Action Buttons
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Primary Action Button
            InkWell(
              onTap: () {
           Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(12.r),
              child: Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.mainColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                width: double.infinity,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.refresh_rounded,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'إعادة المحاولة',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Monadi',
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            SizedBox(height: 12.h),
            
            // // Secondary Action Button
            // InkWell(
            //   onTap: () => Navigator.pop(context),
            //   borderRadius: BorderRadius.circular(12.r),
            //   child: Container(
            //     height: 50.h,
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade100,
            //       borderRadius: BorderRadius.circular(12.r),
            //       border: Border.all(color: Colors.grey.shade300),
            //     ),
            //     width: double.infinity,
            //     child: Center(
            //       child: Text(
            //         'العودة إلى الصفحة السابقة',
            //         style: TextStyle(
            //           fontSize: 16.sp,
            //           fontWeight: FontWeight.w600,
            //           fontFamily: 'Monadi',
            //           color: Colors.grey.shade700,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
       
          ],
        ),
      ),
    );
  }
}