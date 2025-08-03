import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';

class PaymentinfoWidget extends StatelessWidget {
  const PaymentinfoWidget({super.key, required this.title, required this.info});
final String title;
final String info;
  @override
  Widget build(BuildContext context) {
    return                          Padding(
      padding:  EdgeInsets.all(13.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(title,style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: Appfonts.font,
              fontSize: 13,
              color: AppColors.mainColor
          ),),
          Spacer(),
          Text(info,style: TextStyle(
              fontWeight: FontWeight.w400,
              fontFamily: Appfonts.font,
              fontSize: 13,
              color: AppColors.blackColor
          )),

        ],
      ),
    )
    ;
  }
}
