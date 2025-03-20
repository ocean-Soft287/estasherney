import 'package:consult_me/feature/home/presentation/views/widget/speciality_card.dart';
import 'package:flutter/material.dart';
class CustomGridView extends StatelessWidget {
  CustomGridView({super.key});

  final List<Map<String, dynamic>> specialties = [
    {"image": "assets/images/Component 29.png", "label": "أمراض القلب"},
    {"image": "assets/images/Component 29 (1).png", "label": "الأمراض الجلدية"},
    {"image": "assets/images/Component 29 (2).png", "label": "الطب العام"},
    {"image": "assets/images/Component 29 (3).png", "label": "أمراض النساء"},
    {"image": "assets/images/Component 29 (4).png", "label": "طب الأسنان"},
    {"image": "assets/images/Component 29 (5).png", "label": "الأورام"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, 
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1,
          ),
          itemCount: specialties.length,
          itemBuilder: (context, index) {
            return SpecialtyCard(
              imagePath: specialties[index]["image"],
              label: specialties[index]["label"],
            );
          },
        ),
      ),
    );
  }
}
