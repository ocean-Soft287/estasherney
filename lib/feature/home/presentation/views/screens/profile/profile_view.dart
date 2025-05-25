import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/notfication.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/prifacy_policy.dart';
import 'package:consult_me/feature/payment/presentation/view/screens/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/help_center.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/your_profile.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/build_menu_item.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/build_profile_header.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            BuildProfileHeader(),
            const SizedBox(height: 20),
           
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 20),
                shrinkWrap: true,  
                children: [
                  buildMenuItem(Icons.person, "الملف الشخصي", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const YourProfile()));
                  }),
                  buildMenuItem(Icons.favorite, "المفضل", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const Favourites()));
                  }),
                  buildMenuItem(Icons.payment, "طرق الدفع", () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethods()));
                  }),
                  buildMenuItem(Icons.policy, "سياسة الخصوصية", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicyScreen()));
                  }),
                  buildMenuItem(Icons.settings, "الإعدادات", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen()));
                  }),
                  buildMenuItem(Icons.help, "المساعدة", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HelpCenter()));
                  }),
                  buildMenuItem(Icons.notification_add, "الاشعارات", () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Notfication()));
                  }),
                  buildMenuItem(Icons.logout, "تسجيل خروج", () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
