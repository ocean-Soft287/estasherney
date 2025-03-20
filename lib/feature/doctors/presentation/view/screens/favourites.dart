import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Favourites extends StatelessWidget {
  const Favourites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 100.h,
            alignment: Alignment.center,
            child: Text("المفضل",style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontFamily: "LeagueSpartan"
            ),),

            decoration: BoxDecoration(
              gradient:AppColors.blueGradient,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.r),
                bottomRight: Radius.circular(25.r),
              ),
            ),
          ),
SizedBox(
  height: 20,
),
Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [ Spacer(),
      Container(
        width: .4*MediaQuery.sizeOf(context).width,
        height: 40.h,
        decoration: BoxDecoration(

          color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(20.r)
        ),
        alignment: Alignment.center,
        child: Text("الاطباء",style: TextStyle(
            fontSize: 17.sp,
            fontWeight: FontWeight.w800,
            fontFamily: "LeagueSpartan",
          color: AppColors.wightcolor
        ),),

      ),
      Spacer(),

      Container(
        width: .4*MediaQuery.sizeOf(context).width,
        height: 40.h,
        decoration: BoxDecoration(

            color: AppColors.wightcolor,
            borderRadius: BorderRadius.circular(20.r),
          border: Border.all(  color: AppColors.mainColor,width: 1)

        ),
        alignment: Alignment.center,
        child: Text("الخدمات",style: TextStyle(
            fontSize: 17.sp,
            color: AppColors.mainColor,
            fontWeight: FontWeight.w800,
            fontFamily: "LeagueSpartan"
        ),),      ),

      Spacer(),

    ],
  ),
),
        ],),
      ),

    );
  }
}
