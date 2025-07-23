import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/logic/delaete_account_state.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/logic/deleate_account_cubit.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/screens/login_screen.dart';
import 'package:consult_me/feature/payment/presentation/view/screens/payment_methods.dart';
import 'package:flutter/material.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/favourites/presentation/screens/favourites.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/help_center.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/notfication.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/presentation/screens/setting.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/your_profile.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/build_menu_item.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/build_profile_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountCubit, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccountSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('تم حذف الحساب بنجاح')));
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else if (state is DeleteAccountLoading) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('جارٍ حذف الحساب...')));
        } else if (state is DeleteAccountFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('فشل في حذف الحساب')));
        }
      },
      child: Scaffold(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const YourProfile(),
                        ),
                      );
                    }),
                    buildMenuItem(Icons.favorite, "المفضل", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Favourites(),
                        ),
                      );
                    }),
                    buildMenuItem(Icons.payment, "طرق الدفع", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentMethods(),
                        ),
                      );
                    }),
                    buildMenuItem(Icons.settings, "الإعدادات", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsScreen(),
                        ),
                      );
                    }),
                    buildMenuItem(Icons.help, "المساعدة", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HelpCenter(),
                        ),
                      );
                    }),
                    buildMenuItem(Icons.notification_add, "الاشعارات", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Notfication()),
                      );
                    }),
                    buildMenuItem(Icons.logout, "تسجيل خروج", () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text("تأكيد تسجيل الخروج"),
                              content: const Text(
                                "هل أنت متأكد أنك تريد تسجيل الخروج؟",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("لا"),
                                ),
                                SizedBox(width: 30.w),
                                TextButton(
                                  onPressed: () async {
                                    final prefs =
                                        await SharedPreferences.getInstance();
                                    await prefs.clear();

                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: const Text("نعم"),
                                ),
                              ],
                            ),
                      );
                    }),
                    buildMenuItem(Icons.person, "حذف الإيميل", () async {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: const Text("تأكيد حذف الحساب"),
                              content: const Text(
                                "هل أنت متأكد أنك تريد حذف هذا الحساب؟",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("لا"),
                                ),
                                const SizedBox(width: 30),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    context
                                        .read<DeleteAccountCubit>()
                                        .deleteAccount();
                                  },
                                  child: const Text("نعم"),
                                ),
                              ],
                            ),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
