// import 'package:consult_me/core/constants/app_colors.dart';
// import 'package:consult_me/core/constants/app_fonts.dart';
// import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/presentation/logic/update_profile_cubit.dart';
// import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/presentation/screens/new_password_screen.dart';
// import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/presentation/screens/notification.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get_it/get_it.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 60.h,
//               alignment: Alignment.center,
//               decoration: BoxDecoration(
//                 gradient: AppColors.blueGradient,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(25.r),
//                   bottomRight: Radius.circular(25.r),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.arrow_back_ios, color: Colors.white),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   ),
//                   Expanded(
//                     child: Center(
//                       child: Text(
//                         "الإعدادات",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w800,
//                           fontFamily: Appfonts.font,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 48),
//                 ],
//               ),
//             ),

//             SizedBox(height: 20.h),

//             Expanded(
//               child: ListView(
//                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                 children: [
//                   buildMenuItem(Icons.lightbulb, "الإخطارات", () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => NotificationsScreen(),
//                       ),
//                     );
//                   }),
//                   buildMenuItem(Icons.key, "مدير كلمة المرور", () {
//                    Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => BlocProvider(
//       create: (context) => GetIt.instance<UpdateProfileCubit>(),
//       child: const EditProfileScreen(),
//     ),
//   ),
// );

//                   }),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildMenuItem(IconData icon, String title, VoidCallback ontap) {
//     return ListTile(
//       contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
//       leading: CircleAvatar(
//         radius: 20.r,
//         backgroundColor: AppColors.mainColor,
//         child: Icon(icon, color: Colors.white, size: 20.sp),
//       ),
//       title: Text(
//         title,
//         textAlign: TextAlign.right,
//         style: GoogleFonts.leagueSpartan(
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//       trailing: Icon(Icons.chevron_right, color: AppColors.mainColor),
//       onTap: ontap,
//     );
//   }
// }
import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/constants/app_fonts.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/custom_switch.dart';
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

