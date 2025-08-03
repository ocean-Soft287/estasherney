import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';

class PatientDetailsWidget extends StatelessWidget {
  const PatientDetailsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return             Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            Expanded(

              child: Text(
                "الحجز ل",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            SizedBox(width:    .3.sw,),
            Expanded(
              child: Text(
                "شخص اخر",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            Expanded(
              child: Text(
                "الاسم كامل",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            SizedBox(width:    .3.sw,),
            Expanded(
              child: Text(
                "محمد فتحي",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),
            Expanded(
              child: Text(
                "العمر",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackColor,
                ),
              ),
            ),

            SizedBox(width:    .3.sw,),
            Expanded(
              child: Text(
                "30",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Spacer(),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Spacer(),

            Expanded(
              child: Text(
                "الجنس",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackColor,
                ),
              ),
            ),

            SizedBox(width:    .3.sw,),
            Expanded(
              child: Text(
                "ذكر",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            Spacer(),

          ],
        ),
      ],
    );
  }
}
