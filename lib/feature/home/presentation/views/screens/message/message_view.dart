import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/home/presentation/views/screens/message/widget/custom_chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  List<Map<String, dynamic>> messages = [
    {
      "text": "مرحبًا دكتور، عندي بعض الأعراض وأرغب في استشارتك",
      "isUser": true,
      "time": "09:00",
    },
    {
      "text": "أهلًا وسهلًا، تفضل، ما الأعراض التي تشعر بها؟",
      "isUser": false,
      "time": "09:30",
    },
    {
      "text": "أشعر بألم في الصدر وضيق في التنفس أحيانًا، خاصة عند بذل مجهود",
      "isUser": true,
      "time": "09:43",
    },
    {"text": "🔊 (رسالة صوتية)", "isUser": false, "time": "09:50"},
    {"text": "أحيانًا نعم، خصوصًا في الليل", "isUser": true, "time": "09:55"},
    {
      "text": "مرحبًا دكتور، عندي بعض الأعراض وأرغب في استشارتك",
      "isUser": true,
      "time": "09:00",
    },
    {
      "text": "أهلًا وسهلًا، تفضل، ما الأعراض التي تشعر بها؟",
      "isUser": false,
      "time": "09:30",
    },
    {
      "text": "أشعر بألم في الصدر وضيق في التنفس أحيانًا، خاصة عند بذل مجهود",
      "isUser": true,
      "time": "09:43",
    },
    {"text": "🔊 (رسالة صوتية)", "isUser": false, "time": "09:50"},
    {"text": "أحيانًا نعم، خصوصًا في الليل", "isUser": true, "time": "09:55"},
  ];

  TextEditingController _controller = TextEditingController();
  ScrollController _scrollController = ScrollController();

  void sendMessage() {
    String text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        messages.add({"text": text, "isUser": true, "time": "10:00"});
      });
      _controller.clear();
      Future.delayed(Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.wightcolor,
        body: Column(
          children: [
         
            Container(
              width: double.infinity,
              height: 80.h,
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
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20.sp,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  Text(
                    "د/محمد فتحي",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 100.w),
                  Image.asset(
                    "assets/images/Group 50.png",
                    width: 25,
                    height: 25,
                  ),
                  Image.asset(
                    "assets/images/Group 51.png",
                    width: 25,
                    height: 25,
                  ),

                  Image.asset(
                    "assets/images/Group 52.png",
                    width: 25,
                    height: 25,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),

           
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: BouncingScrollPhysics(),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Column(
                  children:
                      messages.map((message) {
                        return ChatBubble(
                          message: message["text"],
                          isUser: message["isUser"],
                          time: message["time"],
                        );
                      }).toList(),
                ),
              ),
            ),

            
            SafeArea(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                color: AppColors.mainColor,
                child: Row(
                  children: [
                   
                    CircleAvatar(
                      backgroundColor: AppColors.wightcolor,
                      child: Image.asset("assets/images/Vector.png"),
                    ),
                    SizedBox(width: 10),

                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "اكتب هنا...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),

               
                    CircleAvatar(
                      backgroundColor: AppColors.wightcolor,
                      child: IconButton(
                        icon: Image.asset("assets/images/Vector 45.png"),
                        onPressed: sendMessage,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
