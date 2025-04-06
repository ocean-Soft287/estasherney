import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/build_header.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class YourProfile extends StatelessWidget {
  const YourProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(),
              buildInfoCards(),
              SizedBox(height: 25.h),
              DefaultButton(text: "تحديث الملف الشخصي", function: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
