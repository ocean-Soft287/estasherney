import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/constants/appimages.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

  @override
  Widget build(BuildContext context) {
 List paymentmethods=[{
   "name":"فيزا",
"image":Appimage.visa
 },{
   "name":"كاش",
   "image":Appimage.cash
 },{

   "name":"انستا باي",
   "image":Appimage.instapay

 }];
    return SafeArea(
      child: Scaffold(
      body:
      CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child:   Column(
            children: [              Container(
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

              SizedBox(
height: 50,
              ),
              Container(
                width: .9*MediaQuery.of(context).size.width,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: AppColors.mainColor.withOpacity(0.1),
borderRadius: BorderRadius.circular(15.r)
                      ),
                      height: 50,
                    child: ListTile(
                      title: Text(
                        paymentmethods[index]["name"].toString(),
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      leading: Image.asset(paymentmethods[index]["image"]), // هنا التصحيح
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 20,
                          decoration: BoxDecoration(
                            color: Colors.transparent ,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.mainColor, width: 1),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 15,
                                decoration: BoxDecoration(
                                  color: index != 0 ? Colors.transparent : AppColors.mainColor,

                                  shape: BoxShape.circle,
                                  border: Border.all(color: AppColors.mainColor, width: 1),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),


                    );
                  },
                  separatorBuilder: (context, index) {
                    return 20.verticalSpace;
                  },
                  itemCount: paymentmethods.length,
                ),
              )


            ],
          ),
        )

      ],)

        ,    ),
    );
  }
}
