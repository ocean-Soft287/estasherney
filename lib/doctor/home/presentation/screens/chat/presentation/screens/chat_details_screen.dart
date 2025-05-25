import 'package:flutter/material.dart';

class ChatDetailScreen extends StatelessWidget {
  

  const ChatDetailScreen();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFE5EDF4),
        appBar: AppBar(
          backgroundColor: Color(0xFF71A9D6),
          title: Text("المحادثات"),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.all(12),
          children: [
            _buildMessageBubble("نلقاه هنا اسم الدواء", "10:59 PM", true),
            _buildMessageBubble("بعته لك في الوصفة التحليل والدواء إذا ماعرفتي تلقينه بلغيني", "11:04 PM", false),
            _buildMessageBubble("تم", "11:04 PM", true),
            _buildMessageBubble("شفتهن تمام، هوا دواء ولا حليب؟", "01:12 AM", true),
            _buildMessageBubble("لا حديد وقائي، دراء شرب تعطينه من الشهر الرابع", "11:41 AM", false),
            _buildMessageBubble("تم.. شكراً", "12:49 PM", true),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(String text, String time, bool isSender) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4),
        padding: EdgeInsets.all(12),
        constraints: BoxConstraints(maxWidth: 280),
        decoration: BoxDecoration(
          color: isSender ? Colors.white : Color(0xFF71A9D6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment:
              isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                color: isSender ? Colors.black : Colors.white,
              ),
            ),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(fontSize: 10, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
