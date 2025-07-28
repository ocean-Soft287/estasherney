import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';

import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constants/app_colors.dart';

import '../../../../../core/constants/app_fonts.dart';

class DoctorDetailsInfo extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorDetailsInfo({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 0.4 * MediaQuery.of(context).size.width,
            height: 0.4 * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: Image.network(
                width: 0.4 * MediaQuery.of(context).size.width,
                height: 0.4 * MediaQuery.of(context).size.width,
                doctor.doctorImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        10.verticalSpace,
        Text(
          doctor.name,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
            fontFamily: Appfonts.font,
            color: AppColors.mainColor,
          ),
        ),
        Text(
          doctor.specialization,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w300,
            fontFamily: Appfonts.font,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
