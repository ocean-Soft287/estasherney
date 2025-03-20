import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_fonts.dart';


class DoctorspecializationInfo extends StatefulWidget {
  const DoctorspecializationInfo({super.key});

  @override
  State<DoctorspecializationInfo> createState() => _DoctorspecializationInfoState();
}

class _DoctorspecializationInfoState extends State<DoctorspecializationInfo> {
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
            // ✅ Container الرئيسي
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
                  Icon(Icons.favorite, color: AppColors.wightcolor),
                  SizedBox(width: 10.w), // ✅ استخدام SizedBox بدل spacing
                  Text(
                    "أمراض القلب",
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
                  "أمراض القلب هي مجموعة من الحالات التي تؤثر على القلب ووظائفه، وتشمل اضطرابات الأوعية الدموية، مشاكل في ضربات القلب، وأمراض صمامات القلب. تُعد هذه الأمراض من الأسباب الرئيسية للوفاة عالميًا، وتتطلب تشخيصًا دقيقًا وعلاجًا مناسبًا للحفاظ على صحة القلب",
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
