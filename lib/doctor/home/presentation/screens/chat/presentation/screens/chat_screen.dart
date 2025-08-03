import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/home/presentation/screens/chat/presentation/screens/chat_details_screen.dart'
    show ChatDetailScreen;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatSceeens extends StatelessWidget {
  final List<Map<String, String>> chats = [
    {
      'name': 'ليلى محمد',
      'message': 'آمنت ووفقت بارك يازين الله',
      'date': '11/04/2025',
    },
    {
      'name': 'Melod Ejbara',
      'message': 'أرسلت 📁 ملف أكثر',
      'date': '26/03/2025',
    },
    {
      'name': 'صفاء محمد علي',
      'message': 'أرسلت صور القراءات ؟',
      'date': '15/03/2025',
    },
    {
      'name': 'hamida algandoz',
      'message': 'هو يعلم كم هي حايمه كلها',
      'date': '30/11/2024',
    },
    {
      'name': 'توال دخيل',
      'message': 'تمام ان شاء الله وشكراً عزيزتي',
      'date': '29/11/2024',
    },
    {
      'name': 'فاطمة المريخي',
      'message': 'أرسلت الملف عزيزتي شكراً',
      'date': '27/01/2023',
    },
  ];
  ChatSceeens({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100.h,
              color: AppColors.mainColor,
              child: Padding(
                padding: EdgeInsets.only(right: 20.h),
                child: Center(
                  child: Text(
                    "المحادثات",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.wightcolor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'ابحث باسم المستخدم',
                  hintStyle: GoogleFonts.leagueSpartan(
                    color: AppColors.mainColor,
                  ),
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: AppColors.mainColor),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: chats.length,
                itemBuilder: (context, index) {
                  final chat = chats[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatDetailScreen(),
                        ),
                      );
                    },
                    child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 22,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.person, color: Colors.grey[700]),
                        ),
                        title: Text(
                          chat['name']!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(chat['message']!),
                        trailing: Text(
                          chat['date']!,
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
