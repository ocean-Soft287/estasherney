import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewAllClinic extends StatelessWidget {
  const ViewAllClinic({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(right: 20.h),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
                    SizedBox(width: 80.w),
                    Text(
                      "عرض جميع المصحات",
                      style: GoogleFonts.leagueSpartan(
                        color: AppColors.mainColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              Divider(),

              SizedBox(height: screenHeight * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "البحث باسم العياده",
                    hintStyle: GoogleFonts.leagueSpartan(
                      color: Color(0xff747474),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: Icon(Icons.search, color: AppColors.mainColor),

                    fillColor: AppColors.greyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),

                      borderSide: BorderSide(color: AppColors.mainColor),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              SizedBox(
                height: screenHeight * 0.7,
                child: ListView.builder(
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        left: 20,
                        top: 10,
                        bottom: 10,
                      ),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.greyColor),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset("assets/images/image (9).png"),
                                Text(
                                  "مستشفي الهرم العام",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Spacer(),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "تم القبول",
                                    style: GoogleFonts.leagueSpartan(
                                      color: AppColors.mainColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Text(
                                  "رقم الهاتف",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "١٢٣٤٥٦٧٨٩",
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Text(
                                  "الموقع الالكتروني",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "Http //ahmed. Com",
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Text(
                                  "المكان",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "القاهره  فيصل الهرم",
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Text(
                                  "وصف",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "",
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Row(
                              children: [
                                Text(
                                  "عده خدمات طبيه",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Text(
                                  "",
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "غادر",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
