import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/constants/images_svg.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
            
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.arrow_back_ios_new_outlined, color: AppColors.wightcolor),
                      Expanded(
                        child: Center(
                          child: Text(
                            "تم الدفع",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: Appfonts.font,
                              color: AppColors.wightcolor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                20.verticalSpace,
                SvgPicture.asset(ImagesSvg.confirm),
                Column(
                  children: [
                    Text(
                      "تهانينا",
                      style: TextStyle(
                        fontFamily: Appfonts.font,
                        fontWeight: FontWeight.w600,
                        fontSize: 40,
                        color: AppColors.mainColor,
                      ),
                    ),
                    Text(
                      "تم الدفع بنجاح",
                      style: TextStyle(
                        fontFamily: Appfonts.font,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: AppColors.brown,
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.11),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "تم الدفع بنجاح",
                          style: TextStyle(
                            fontFamily: Appfonts.font,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: AppColors.brown,
                          ),
                        ),
                        10.verticalSpace,
            
                        Text(
                          "د/محمد فتحي",
                          style: TextStyle(
                            fontFamily: Appfonts.font,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: AppColors.brown,
                          ),
                        ),
                        10.verticalSpace,
            
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Row(children: [
                            Icon(Icons.calendar_month,color: AppColors.mainColor,),
            
                            Text("12/3/2025",style: TextStyle(
                              color: AppColors.brown,
                              fontSize: 13,
                              fontWeight: FontWeight.w500
                            ),),
            
                          ],),
                        ),
                        Spacer(),
                        Expanded(
                          flex: 1,
                          child: Row(children: [
                            Icon(Icons.alarm,color: AppColors.mainColor,),
            
                            Text("10:00 ص ",style: TextStyle(
                                color: AppColors.brown,
                                fontSize: 13,
                                fontWeight: FontWeight.w500
                            ),),
                          ],),
                        )
            
                      ],
                    )
            
                      ],
                    ),
                  ),
                ),
                10.verticalSpace,
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor.withOpacity(0.11),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      SvgPicture.asset(ImagesSvg.download),
            10.horizontalSpace,
                      Text(
                        "تنزيل الايصال",
                        style: TextStyle(
                          fontFamily: Appfonts.font,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: AppColors.brown,
                        ),
                      ),
                      Spacer(),
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
