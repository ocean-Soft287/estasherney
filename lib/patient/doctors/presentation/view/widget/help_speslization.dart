import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpSpeslization extends StatefulWidget {
  const HelpSpeslization({super.key});

  @override
  State<HelpSpeslization> createState() => _HelpSpeslizationState();
}

class _HelpSpeslizationState extends State<HelpSpeslization> {
  bool isinfo = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isinfo = !isinfo;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            
            Container(
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(20),
              ),
              width: 0.9 * MediaQuery.of(context).size.width,
              height: 40.h,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                 
                  SizedBox(width: 10.w), 
                  Text(
                    " الالتزام بالقوانين والأنظمة",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      fontFamily: Appfonts.font,
                      color: AppColors.wightcolor,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    isinfo ? Icons.arrow_upward_outlined : Icons.arrow_downward_outlined,
                    color: AppColors.wightcolor,
                  ),
                ],
              ),
            ),

            if (isinfo) ...[
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.mainColor.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(20),
                ),
                 width: 0.9 * MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "يجب على جميع الأعضاء الالتزام بالقوانين والسلوك المهني، استخدام الموارد بمسؤولية، الحفاظ على سرية المعلومات، واتباع إرشادات السلامة لضمان بيئة عمل آمنة ومنظمة. ",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w300,
                    fontFamily: Appfonts.font,
                    color: AppColors.grycolor,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
    ]     ],
        ),
      ),
    );
  }
}
