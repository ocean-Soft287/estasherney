import 'package:consult_me/core/Network/local/secure_storage.dart';
import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/auth/presentation/pages/login_page_screen.dart';
import 'package:consult_me/doctor/home/presentation/screens/Additionaloptions/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AdditionalOption extends StatefulWidget {
  const AdditionalOption({super.key});

  @override
  State<AdditionalOption> createState() => _AdditionalOptionState();
}

class _AdditionalOptionState extends State<AdditionalOption> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
       IconButton(onPressed: (){
         Navigator.pop(context);
       }, icon:                   Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
),
                  SizedBox(width: 80.w),
                  Text(
                    'خيارات إضافية',
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  Spacer(),
                  Image.asset("assets/images/Group 111.png"),
                ],
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                width: 354.w,
                height: 54.h,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xff14C8C7),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xff14C8C7)),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/Group (12).png"),
                    SizedBox(width: 10.w),
                    Text(
                      'تشغيل الإشعارات',
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Spacer(),
                    Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                      activeColor: AppColors.mainColor,
                      activeTrackColor: Colors.grey,
                      inactiveThumbColor: AppColors.mainColor,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen()),
                  );
                },
                child: Container(
                  width: 354.w,
                  height: 54.h,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color(0xff14C8C7),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xff14C8C7)),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/Group 103.png"),
                      SizedBox(width: 10.w),
                      Text(
                        'الإعدادات',
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  showLogoutDialog(context);
                },
                child: Container(
                  width: 354.w,
                  height: 54.h,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xff14C8C7),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xff14C8C7)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.logout, color: AppColors.mainColor),
                      SizedBox(width: 10.w),
                      Text(
                        'تسجيل خروج',
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          backgroundColor: const Color(0xFFD9D9D9),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout, size: 60.sp, color: AppColors.mainColor),
              SizedBox(height: 16.h),
              Text(
                "هل تريد تسجيل الخروج؟",
                style: GoogleFonts.leagueSpartan(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.mainColor,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF131874),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "العودة",
                        style: GoogleFonts.leagueSpartan(
                          color: Colors.white,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        await SharedPreferencesService.clearAll();

                        Navigator.pop(context);

                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginDoctorScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Text(
                        "تسجيل الخروج",
                        style: GoogleFonts.leagueSpartan(
                          color: Colors.red,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
  );
}
