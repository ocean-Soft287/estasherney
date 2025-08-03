import 'package:consult_me/patient/auth/presentation/views/screens/login/presentation/logic/delaete_account_state.dart';
import 'package:consult_me/patient/auth/presentation/views/screens/login/presentation/logic/deleate_account_cubit.dart';
import 'package:consult_me/patient/auth/presentation/views/screens/login/presentation/screens/login_screen.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/screens/setting/presentation/logic/update_profile_cubit.dart';
import 'package:consult_me/patient/payment/presentation/view/screens/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:consult_me/patient/doctors/presentation/view/screens/favourites/presentation/screens/favourites.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/screens/help_center.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/screens/notfication.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/screens/setting/presentation/screens/setting.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/screens/your_profile.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/widget/build_menu_item.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/widget/build_profile_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:consult_me/core/services/local_services.dart' as db;

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
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF8F9FC),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10.h),
                child: BuildProfileHeader(),
              ),

              SizedBox(height: 12.h),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 8.h,
                  ),
                  shrinkWrap: true,
                  children: [
                    buildMenuItem(Icons.person, "الملف الشخصي", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => BlocProvider(
                                create:
                                    (context) => db.sl<UpdateProfileCubit>(),
                                child: const EditProfileScreen(),
                              ),
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
                    // buildMenuItem(Icons.payment, "طرق الدفع", () {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => PaymentMethods(),
                    //     ),
                    //   );
                    // }),
                 
                    buildMenuItem(Icons.settings, "الإعدادات", () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Notfication()),
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

                    // Logout
                    buildMenuItem(Icons.logout, "تسجيل خروج", () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              title: Text(
                                "تأكيد تسجيل الخروج",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              content: Text(
                                "هل أنت متأكد أنك تريد تسجيل الخروج؟",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "لا",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
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
                                  child: Text(
                                    "نعم",
                                    style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                      );
                    }),

                    // Delete Account
                    buildMenuItem(Icons.delete_outline, "حذف الحساب", () {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              title: Text(
                                "تأكيد حذف الحساب",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade800,
                                ),
                              ),
                              content: Text(
                                "هل أنت متأكد أنك تريد حذف هذا الحساب؟",
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text(
                                    "لا",
                                    style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    context
                                        .read<DeleteAccountCubit>()
                                        .deleteAccount();
                                  },
                                  child: Text(
                                    "نعم",
                                    style: TextStyle(
                                      color: Colors.red.shade700,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
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
