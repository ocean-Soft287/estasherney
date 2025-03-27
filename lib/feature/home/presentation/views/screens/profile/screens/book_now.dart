import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetBooKNow extends StatelessWidget {
   ResetBooKNow({super.key});

  
  final List<String> doctors = List.generate(5, (index) => "د/ محمد فتحي");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
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
                          "الحجوزات",
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
              
              Padding(
                padding: EdgeInsets.all(12),
                child: ListView.builder(
                  itemCount: doctors.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(), 
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppColors.wightcolor,
                      shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.only(bottom: 15),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: AssetImage("assets/images/doctor.png"), 
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctors[index],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    Text(
                                      "جراحة الأمراض الجلدية",
                                      style: TextStyle(fontSize: 14, color: Colors.black),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: AppColors.mainColor, size: 18),
                                    Text("4.5"),
                                    SizedBox(width: 5),
                                    Icon(Icons.favorite_border, color:AppColors.mainColor),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 12),

           
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                  child: Text("تأكيد الحجز", style: TextStyle(color: Colors.white)),
                                ),
                                OutlinedButton(
                                  onPressed: () {},
                                  child: Text("إضافة تقييم"),
                                ),
                              ],
                            ),
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
