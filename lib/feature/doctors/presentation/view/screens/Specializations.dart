import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/doctor_for_specialization.dart';
import 'package:flutter/material.dart';

class Specializations extends StatelessWidget {
  const Specializations({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> specializations = [
      {"icon": "assets/genre/heart.png", "label": "أمراض القلب"},
      {"icon": "assets/genre/skin.png", "label": "أمراض جلدية"},
      {"icon": "assets/genre/general.png", "label": "الطب العام"},
      {"icon": "assets/genre/women.png", "label": "أمراض النساء"},
      {"icon": "assets/genre/teeth.png", "label": "طب الأسنان"},
      {"icon": "assets/genre/cancer.png", "label": "الأورام"},
      {"icon": "assets/genre/eye_medical.png", "label": "الطب البصري"},
      {"icon": "assets/genre/Bones.png", "label": "عظام"},
    ];

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              width: double.infinity,
              height: 220, // زودنا الارتفاع لاستيعاب مربع البحث
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade500,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      Text(
                        'التخصصات',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          fontFamily: "LeagueSpartan",
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'ابحث عن طبيبك',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "LeagueSpartan",
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(1, 1),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 15), // مسافة بين النصوص ومربع البحث
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'ابحث...',
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            const Text(
              "التخصصات",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.builder(
                  itemCount: specializations.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 18,
                    mainAxisSpacing: 18,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorForSpecialization()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: AppColors.mainColor),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              specializations[index]["icon"]!,
                              width: 50,
                              height: 50,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              specializations[index]["label"]!,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
