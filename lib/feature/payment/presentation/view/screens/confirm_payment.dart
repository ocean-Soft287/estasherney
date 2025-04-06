import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/constants/app_fonts.dart';
import '../../../../../core/constants/images_svg.dart';
import '../widget/confirmation_widget.dart';

class ConfirmPayment extends StatelessWidget {
  const ConfirmPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
              Align(
                  alignment: Alignment.center,
                  child: ConfirmationWidget()),

            ],
          ),
        ),
      ),
    );
  }
}
