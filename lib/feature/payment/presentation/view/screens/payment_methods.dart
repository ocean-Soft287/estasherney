import 'package:consult_me/feature/payment/presentation/view/screens/confirm_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/constants/appimages.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    List paymentmethods = [
      {"name": "فيزا", "image": Appimage.visa},
      {"name": "كاش", "image": Appimage.cash},
      {"name": "انستا باي", "image": Appimage.instapay},
    ];

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
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
                        Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: AppColors.wightcolor,
                        ),
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

                  SizedBox(height: 50),
                  SizedBox(
                    width: .9 * MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        bool isSelected = selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ConfirmPayment(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            height: 60,
                            child: ListTile(
                              title: Text(
                                paymentmethods[index]["name"].toString(),
                                style: TextStyle(
                                  fontFamily: 'LeagueSpartan',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              leading: Image.asset(
                                paymentmethods[index]["image"],
                                height: 30,
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: AppColors.mainColor,
                                      width: 1.5,
                                    ),
                                  ),
                                  child: isSelected
                                      ? Center(
                                          child: Container(
                                            width: 14,
                                            height: 14,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColors.mainColor,
                                            ),
                                            child: const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                              size: 12,
                                            ),
                                          ),
                                        )
                                      : null,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
