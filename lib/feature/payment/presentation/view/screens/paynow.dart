import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/constants/images_svg.dart';
import '../../../../../core/widget/defualt_botton.dart';

class Paynow extends StatelessWidget {
  const Paynow({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                height: 130,
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
                    Icon(
                      Icons.arrow_back_ios_new_outlined,
                      color: AppColors.wightcolor,
                    ),
                    Expanded(
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "تم الدفع",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                                fontFamily: Appfonts.font,
                                color: AppColors.wightcolor,
                              ),
                            ),
                            Text(
                              " 100.00",
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.w600,
                                fontFamily: Appfonts.font,
                                color: AppColors.wightcolor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.verticalSpace,
              ListTile(
                leading:Container(
                  height: 100,
                  width: 70,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red
                  ),
                  clipBehavior: Clip.antiAlias, // لمنع تجاوز الصورة للحاوية
                  child: Image.network(
                    "https://s3-alpha-sig.figma.com/img/b8d6/2275/79eeffdf8fcd370cd2523e8fbd4ee613?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=XxMaluv4NVKuzGNAJKi5mu4SBTer~dqhrjQRIuI2fJZV6VLOAr5JVoT-13BjKwxVgYeKWuWUKiihtbyo8JlzHxJ6WA4pZlfRYVE8MgI7i9jDPn0KEVtit~Zj1mgHybqdX3CK61pf0Gy2kvQAWf21lIlcNsx5eBqLX1x9Sz7DZXDxwTa4jVluQlj2Ax7U8dK5GuuO~XZBkLet93hEgWpA0yP9wOh-U9kP3sMOnkHV1iQ1InQCnmx~AlffFjhi2KatMD4y99-ZEuqSQiqUxrskCjWk9kt6u0GDE4Dox2rYLF1rjRkWDptKfhT091Td~Inih3Ol6FskCFifMVgFh0JMRg__",
                    fit: BoxFit.cover, // لضمان تغطية الصورة للحاوية الدائرية
                  ),
                ),

                title: Column(
                  children: [
                    Row(
                      children: [
                        30.horizontalSpace,

                        Column(
                          children: [
                            Text("د/ محمد فتحي",style: TextStyle(
                              fontFamily: Appfonts.font,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.mainColor
                            ),),
                            Text("حراجه عظام",style: TextStyle(
                                fontFamily: Appfonts.font,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                                color: AppColors.blackColor
                            ),),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        30.horizontalSpace,
                        Column(
                          children: [

                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 50.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.wightcolor,
                                      border: Border.all(color: AppColors.mainColor,width: 2)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("30",style: TextStyle(
                                          fontFamily: Appfonts.font,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          color: AppColors.blackColor
                                      ),),
                                      SvgPicture.asset(ImagesSvg.chat,color: AppColors.mainColor,height: 13,width: 13,)


                                    ],
                                  ),
                                ),
                                SizedBox(width: 30,),
                                Container(
                                  alignment: Alignment.center,
                                  width: 50.w,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: AppColors.wightcolor,
                                      border: Border.all(color: AppColors.mainColor,width: 2)
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("30",style: TextStyle(
                                          fontFamily: Appfonts.font,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 14,
                                          color: AppColors.blackColor
                                      ),),
                                      SvgPicture.asset(ImagesSvg.star,color: AppColors.mainColor,height: 12,width: 11,)


                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],

                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              Row(
                children: [
                  Text("التاريخ / الساعة"),
                  Spacer(),
                  Text("15/2 / 10:00 صباحًا"),

                ],
              ),
              Row(
                children: [
                  Text("التاريخ / الساعة"),
                  Spacer(),
                  Text("15/2 / 10:00 صباحًا"),

                ],
              ),
              Row(
                children: [
                  Text("التاريخ / الساعة"),
                  Spacer(),
                  Text("15/2 / 10:00 صباحًا"),

                ],
              ),
              DefaultButton(text: "ادفع الان", function: (){},width: .9*MediaQuery.of(context).size.width,heightButton: 45,)

            ],
          ),
        ),
      ),
    );
  }
}
