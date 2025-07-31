import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors, Icons, ListTile;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "الدفع",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: Appfonts.font,
                        color: AppColors.wightcolor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "\$ 100.00",
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        fontFamily: Appfonts.font,
                        color: AppColors.wightcolor,
                      ),
                    ),
                  ],
                ),
              ),
              Directionality(
                textDirection: TextDirection.ltr,
                child: Positioned(
                  right: 16,
                  top: 16,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.wightcolor,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
        20.verticalSpace,
        ListTile(
          leading: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              "https://s3-alpha-sig.figma.com/img/b8d6/2275/79eeffdf8fcd370cd2523e8fbd4ee613?Expires=1743984000&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=XxMaluv4NVKuzGNAJKi5mu4SBTer~dqhrjQRIuI2fJZV6VLOAr5JVoT-13BjKwxVgYeKWuWUKiihtbyo8JlzHxJ6WA4pZlfRYVE8MgI7i9jDPn0KEVtit~Zj1mgHybqdX3CK61pf0Gy2kvQAWf21lIlcNsx5eBqLX1x9Sz7DZXDxwTa4jVluQlj2Ax7U8dK5GuuO~XZBkLet93hEgWpA0yP9wOh-U9kP3sMOnkHV1iQ1InQCnmx~AlffFjhi2KatMD4y99-ZEuqSQiqUxrskCjWk9kt6u0GDE4Dox2rYLF1rjRkWDptKfhT091Td~Inih3Ol6FskCFifMVgFh0JMRg__",
              fit: BoxFit.cover,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "د/ محمد فتحي",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: AppColors.mainColor,
                ),
              ),
              Text(
                "حراجه عظام",
                style: TextStyle(
                  fontFamily: Appfonts.font,
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}
