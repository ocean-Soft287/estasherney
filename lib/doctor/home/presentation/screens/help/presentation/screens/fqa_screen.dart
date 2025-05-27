import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FAQScreen extends StatelessWidget {
  final List<String> questions = [
    "ماهي منصة استشيرني؟",
    "كيف أتحقق من أمن بياناتي؟",
    "ماهي الخدمات المتوفرة عبر التطبيق؟",
    "من هم الأطباء الذين بإمكاني التواصل معهم؟",
    "ماهي طرق التواصل المتاحة حاليا؟",
    "هل بإمكاني التواصل مع الطبيب بإستخدام الرسائل النصية؟",
    "هل بإمكاني إلغاء حسابي بعد إنتهاء الفترة التجريبية؟",
    "من هي الفئة المستهدفة من هذا التطبيق؟",
    "متي ستكون هذه الخدمة متوفرة؟",
    "هل بإمكاني الانضمام لفريق استشيرني؟",
    "كيف ألغي الموعد وأسترد القيمة؟",
    "هل توجد جميع التخصصات؟",
    "كيف أقوم بشحن محفظتي باستخدام أي كاش؟",
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF21CED6),
          centerTitle: true,
          leading: Icon(Icons.arrow_back_ios, color: AppColors.mainColor),
          title: Expanded(
            child: Text(
              "الأسئلة الشائعة للمستخدمين",
              style: TextStyle(color: AppColors.mainColor, fontSize: 18),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        body: ListView.separated(
          itemCount: questions.length,
          separatorBuilder:
              (_, __) =>
                  Divider(height: 1, thickness: 2, color: Colors.grey[300]),
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.help_outline, color: AppColors.mainColor),
              title: Text(
                questions[index],
                style: GoogleFonts.leagueSpartan(
                  fontSize: 13,
                  color: AppColors.mainColor,
                ),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: AppColors.mainColor,
              ),
              onTap: () {
                // TODO: Navigate to answer page or show dialog with answer
              },
            );
          },
        ),
      ),
    );
  }
}
