import 'package:custom_rating_bar/custom_rating_bar.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';

import '../../../../../core/constants/app_fonts.dart';

class DoctorDetailsInfo extends StatelessWidget {
  const DoctorDetailsInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 0.4 * MediaQuery.of(context).size.width,
            height: 0.4 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                width: 0.4 * MediaQuery.of(context).size.width,
                height: 0.4 * MediaQuery.of(context).size.width,
                "https://cdn.ida2at.com/media/2021/05/%D9%84%D8%B9%D8%A8%D8%A9-%D9%86%D9%8A%D9%88%D8%AA%D9%86-%D8%AF%D8%B1%D8%A7%D9%85%D8%A7.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        10.verticalSpace,
        Text("د/ محمد فتحي",style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: Appfonts.font,
            color: AppColors.mainColor
        ),),
        Text("حراجه مخ واعصاب",style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            fontFamily: Appfonts.font,
            color: AppColors.blackColor
        ),),
        Row(
          children: [
            Spacer(),
            Directionality(

              textDirection: TextDirection.ltr,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor,width: 2),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: RatingBar.readOnly(
                    size: 25,
                    isHalfAllowed: true,
                    alignment: Alignment.centerRight,
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    filledColor: AppColors.mainColor,
                    emptyColor:AppColors.mainColor,
                    halfFilledColor: AppColors.mainColor,
                    initialRating: 3.5,
                    halfFilledIcon: Icons.star_half,
                  ),
                ),
              ),
            ),
            10.horizontalSpace,
            Container(
              width: 30.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.mainColor,width: 2),
              ),
              child: Icon(Icons.favorite,color: AppColors.wightcolor,),
            ),
            Spacer(),
          ],
        ),
        20.verticalSpace,

      ],
    );
  }
}
