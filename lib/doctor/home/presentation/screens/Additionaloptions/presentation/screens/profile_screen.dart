import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:consult_me/core/Network/local/secure_storage.dart';

class ProfileDoctorScreen extends StatefulWidget {
  const ProfileDoctorScreen({super.key});

  @override
  State<ProfileDoctorScreen> createState() => _ProfileDoctorScreenState();
}

class _ProfileDoctorScreenState extends State<ProfileDoctorScreen> {
  String? fullName;
  String? emaill;
  String? imageUrl;
  String? specialization;
  String? phone;
  String? nationalID;
  String? yearsOfExperience;
  String? doctorPercentage;

  String? examenPrice;

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final name = await SharedPreferencesService.read(
      SharedPreferencesService.firstName,
    );
    final email = await SharedPreferencesService.read(
      SharedPreferencesService.email,
    );
    final image = await SharedPreferencesService.read(
      SharedPreferencesService.picture,
    );
    final special = await SharedPreferencesService.read("specialization");
    final phoneNum = await SharedPreferencesService.read("phone");
    final nid = await SharedPreferencesService.read("nationalID");
    final exp = await SharedPreferencesService.read("yearsOfExperience");
    final perc = await SharedPreferencesService.read("doctorPersentage");
    final price = await SharedPreferencesService.read(
      SharedPreferencesService.examenPrice,
    );

    setState(() {
      emaill = email;
      fullName = name;
      imageUrl = image;
      specialization = special;
      phone = phoneNum;
      nationalID = nid;

      yearsOfExperience = exp;
      doctorPercentage = perc;
      examenPrice = price;
    });
  }

  Widget buildInfoRow(String title, String? value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.leagueSpartan(
              color: AppColors.mainColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 5.h),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.wightcolor),
              color: AppColors.wightcolor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Text(
              value ?? 'غير متوفر',
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.mainColor,
                      ),
                    ),
                    SizedBox(width: 80.w),
                    Text(
                      'الملف الشخصي',
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 20.sp,
                      ),
                    ),
                    Spacer(),
                    Image.asset("assets/images/Group 111.png"),
                  ],
                ),
                Divider(),
                SizedBox(height: 20.h),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.mainColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: CircleAvatar(
                          radius: 50.r,
                          backgroundImage:
                              imageUrl != null
                                  ? NetworkImage(imageUrl!)
                                  : AssetImage("assets/images/DrAva.png")
                                      as ImageProvider,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      buildInfoRow('الاسم الكامل', fullName),
                      buildInfoRow('التخصص', specialization),
                      buildInfoRow('رقم الهاتف', phone),

                      buildInfoRow('الرقم القومي', nationalID),
                      buildInfoRow('سنوات الخبرة', yearsOfExperience),
                      buildInfoRow('سعر الكشف', "$examenPrice جنيه"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
