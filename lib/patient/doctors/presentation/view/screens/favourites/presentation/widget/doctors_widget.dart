import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../../core/constants/app_fonts.dart';
import '../../../../../../../../core/widget/defualt_botton.dart';

class DoctorsWidget extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String imageUrl;
  final VoidCallback onDelete;

  const DoctorsWidget({
    super.key,
    required this.doctorName,
    required this.specialization,
    required this.imageUrl,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(7.r),
                width: 70,
                height: 70,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 6,
                        offset: Offset(2, 4),
                      ),
                    ],
                  ),
                  child: CircleAvatar(
                    radius: 30.r,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: NetworkImage(imageUrl, scale: 0.5),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontFamily: Appfonts.font,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    specialization,
                    style: TextStyle(
                      color: AppColors.brown,
                      fontFamily: Appfonts.font,
                      fontWeight: FontWeight.w300,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DefaultButton(
                radius: 10,
                text: 'احذف',
                function: onDelete,
                width: .2 * width,
                heightButton: 25.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
