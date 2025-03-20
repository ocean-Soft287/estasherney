import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/constants/appimages.dart';
import '../../../../../core/widget/defualt_botton.dart';

class DoctorsWidget extends StatelessWidget {
  const DoctorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Image.asset("assets/images/DrAva.png"),
            ),
            SizedBox(width: 10.w,),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.mainColor,
                      child: SvgPicture.asset(Appimage.trophy),
                      //
                    ),
                    SizedBox(width: 5),
                    Text(
                      "استاذ دكتور",
                      style: TextStyle(
                        color: AppColors.brown,
                        fontFamily: Appfonts.font,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "د/احمد محمد علي",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontFamily: Appfonts.font,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      width:width<500? .3*MediaQuery.sizeOf(context).width:.5*MediaQuery.sizeOf(context).width,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColors.wightcolor,
                        child: Icon(Icons.favorite,size: 20,),
                        //
                      ),
                    ),
                  ],
                ),
                Text(
                  "طب الأم والجنين",
                  style: TextStyle(
                    color: AppColors.brown,
                    fontFamily: Appfonts.font,
                    fontWeight: FontWeight.w300,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 10,),
        Align(
          alignment: Alignment.center,
          child: DefaultButton(text: 'تحديد موعد', function: (){},width:.9*MediaQuery.sizeOf(context).width,
            heightButton:25.h
            ,),
        ),
        Padding(padding: const EdgeInsets.all(8.0), child: Divider()),

      ],
    );
  }
}
