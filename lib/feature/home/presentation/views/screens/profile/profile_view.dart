import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/prifacy_policy.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/your_profile.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/build_menu_item.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/build_profile_header.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: Column(
                children: [
                  buildProfileHeader(),
                  const SizedBox(height: 20),
                  buildMenuItem(Icons.person, "الملف الشخصي",(){
                 Navigator.push(context, MaterialPageRoute(builder: (context) => YourProfile()));
                  }),
                  buildMenuItem(Icons.favorite, "المفضل",(){}),
                  buildMenuItem(Icons.payment, "طرق الدفع",(){}),
                  buildMenuItem(Icons.policy, "سياسة الخصوصية",(){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));

                  }),
                  buildMenuItem(Icons.settings, "الإعدادات",(){
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                  }),
                  buildMenuItem(Icons.help, "المساعدة",(){
                     
                  }),
                  buildMenuItem(Icons.logout, "تسجيل خروج",(){}),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
