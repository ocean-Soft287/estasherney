import 'package:consult_me/core/constants/images_svg.dart';
import 'package:consult_me/feature/payment/presentation/view/screens/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/widget/defualt_botton.dart';
import '../widget/patient_details_widget.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
            Container(
            height: 200,
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
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Positioned(
                    top: 16,
                    right: 16,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.wightcolor,
                      size: 24,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "موعدك",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: Appfonts.font,
                          color: AppColors.wightcolor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Stack(
                        children: [
                          Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .8,
                                  height: 130,
                                  decoration: BoxDecoration(
                                    color: AppColors.wightcolor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          
                                          children: [
                                            Container(
                                              width: 50.w,
                                              height: 50.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.asset(
                                                "assets/images/Dr. Emma.png",
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                            10.horizontalSpace,
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("د/محمد فتحي", style: TextStyle(fontWeight: FontWeight.w600)),
                                                Text("جراحه مخ واعصاب"),
                                                Row(
                                                  children: [
                                                    SizedBox(width: 10),
                                                    _buildInfoBox("30", ImagesSvg.chat),
                                                    SizedBox(width: 10),
                                                    _buildInfoBox("30", Icons.star),
                                                    SizedBox(width: 10),
                                                    _buildIconBox(Icons.favorite),
                                                    SizedBox(width: 10),
                                                    _buildIconBox(Icons.question_mark),
                                                    SizedBox(width: 10),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


           20.verticalSpace,
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: .4*MediaQuery.of(context).size.width,

                        decoration: BoxDecoration(
                            color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(30)
                        ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text("الشهر 24، السنة",style: TextStyle(
                              fontFamily: Appfonts.font,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.wightcolor
                            ),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.centerRight,
                          width: .4*MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text("الأربعاء، الساعة 10:00 صباحًا",style: TextStyle(
                              fontFamily: Appfonts.font,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.brown
                          ),),
                        ),
                      ),

                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(Icons.close, color: Colors.white, size: 20),
                        ),
                        SizedBox(width: 20), // مسافة بين الأيقونتين

                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.mainColor, // اللون البنفسجي
                            shape: BoxShape.circle,
                          ),
                          padding: EdgeInsets.all(12),
                          child: Icon(Icons.check, color: Colors.white, size: 20),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
              10.verticalSpace,
              Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
              PatientDetailsWidget(),
              20.verticalSpace,


              Padding(padding: const EdgeInsets.all(8.0), child: Divider()),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "المشكله",
                      style: TextStyle(
                        fontFamily: Appfonts.font,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "أنا أشعر بصداع مستمر منذ فترة، وأحيانًا يكون شديدًا لدرجة يؤثر على تركيزي وأنشطتي اليومية. يرافقه أحيانًا دوخة وتنميل خفيف في يدي، خاصة عند الاستيقاظ من النوم. كما أنني ألاحظ ضعفًا طفيفًا في الذاكرة ونسيان بعض الأمور البسيطة",
                  style: TextStyle(
                    fontFamily: Appfonts.font,
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: AppColors.blackColor.withOpacity(0.37),
                  ),
                ),
              ),
          30.verticalSpace,
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultButton(text: 'ادفع', function: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentMethods()));
                    },width: .3*MediaQuery.of(context).size.width,heightButton: 30.h,),
                    DefaultButton(text: 'الغاء', function: (){},width: .3*MediaQuery.of(context).size.width,heightButton: 30.h,)


                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );

  }

  Widget _buildInfoBox(String text, dynamic icon) {
    return Container(
      alignment: Alignment.center,
      width: 51,
      height: 30,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffE9F6FE), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Spacer(),
          Text(text),
          icon is IconData
              ? Icon(icon, color: AppColors.mainColor)
              : SvgPicture.asset(icon, color: AppColors.mainColor, width: 15, height: 15),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildIconBox(IconData icon) {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: AppColors.mainColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: AppColors.mainColor),
    );
  }
}

