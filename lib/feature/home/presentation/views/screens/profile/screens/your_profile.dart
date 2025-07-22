import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/build_header.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/custom_card.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  String fullName = '';
  String phone = '';
  String email = '';
  String birthDate = '';
  String? imageUrl = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      fullName = prefs.getString('fullName') ?? 'غير معروف';
      phone = prefs.getString('phoneNumber') ?? 'غير معروف';
      email = prefs.getString('email') ?? 'غير معروف';
      birthDate = prefs.getString('birthday') ?? 'غير معروف';
      imageUrl = prefs.getString('imageUrl');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(context: context, imageUrl: imageUrl),
              customcart(
                fullName: fullName,
                phone: phone,
                email: email,
                birthDate: birthDate,
              ),
              SizedBox(height: 25.h),
            ],
          ),
        ),
      ),
    );
  }
}
