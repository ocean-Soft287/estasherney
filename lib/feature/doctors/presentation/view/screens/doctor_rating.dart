import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/widget/defualt_botton.dart';
import '../widget/doctor_details_info.dart';

class DoctorRating extends StatelessWidget {
  const DoctorRating({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController helpNote = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: AppColors.blueGradient,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "الدفع",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            fontFamily: Appfonts.font,
                            color: AppColors.wightcolor,
                          ),
                        ),

                      ],
                    ),
                  ),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Positioned(
                      right: 16,
                      top: 16,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.wightcolor,
                        size: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DoctorDetailsInfo(),
Container(
              padding: EdgeInsets.all(10), // Add padding to TextField
              decoration: BoxDecoration(
                color:
                AppColors.mainColor.withOpacity(0.05), // Background color for note effect
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              width: MediaQuery.of(context).size.width*.9, // Adjust width as per your requirement
              height: 200.h, // Adjust height as per your requirement
              child: TextField(
                controller: helpNote,
                maxLines: 10, // Allowing multiple lines of text
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      color: AppColors.blackColor,
                      fontFamily: GoogleFonts.leagueSpartan().fontFamily),
                  hintText: "أدخل تعليقك هنا...", // Placeholder text
                  border: InputBorder.none, // Remove border
                ),
              ),
            ),
            20.verticalSpace,
            DefaultButton(text: 'اضافه تقيم',
              function: (){},
                width: 0.9*MediaQuery.of(context).size.width,

            ),
          ],
        ),

      ),
    );
  }
}
