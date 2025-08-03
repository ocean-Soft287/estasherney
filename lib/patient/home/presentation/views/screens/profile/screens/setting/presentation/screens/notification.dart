import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/constants/app_fonts.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/widget/custom_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  bool isGeneralNotification = true;
  bool isSoundEnabled = true;
  bool isCallNotification = true;
  bool isSpecialOffers = false;
  bool isPaymentNotification = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: AppColors.blueGradient,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.r),
                  bottomRight: Radius.circular(25.r),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "الاخطارات",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          fontFamily: Appfonts.font,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 48),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                children: [
                  buildSwitchTile("إشعار عام", isGeneralNotification, (value) {
                    setState(() => isGeneralNotification = value);
                  }),
                  buildSwitchTile("الصوت", isSoundEnabled, (value) {
                    setState(() => isSoundEnabled = value);
                  }),
                  buildSwitchTile("مكالمة صوتية", isCallNotification, (value) {
                    setState(() => isCallNotification = value);
                  }),
                  buildSwitchTile("عروض خاصة", isSpecialOffers, (value) {
                    setState(() => isSpecialOffers = value);
                  }),
                  buildSwitchTile("الدفع", isPaymentNotification, (value) {
                    setState(() => isPaymentNotification = value);
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
