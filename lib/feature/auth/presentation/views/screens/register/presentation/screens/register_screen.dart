import 'dart:typed_data';

import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/screens/login_screen.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/otp/presentation/screens/otp_screen.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/register/presentation/logic/register_cubit.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/register/presentation/logic/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  bool obscurePassword = true;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController birthdateController = TextEditingController();

  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.reset();
    _controller.forward();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    birthdateController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => GetIt.instance<RegisterCubit>(),
        child: Scaffold(
          body: BlocConsumer<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder:
                      (_) => const Center(child: CircularProgressIndicator()),
                );
              } else {
                Navigator.of(context, rootNavigator: true).pop();
              }

              if (state is RegisterSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'تم إنشاء الحساب، تحقق من بريدك الإلكتروني برمز OTP',
                    ),
                  ),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VerifyOtpScreen()),
                );
              } else if (state is RegisterFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("فشل في إنشاء الحساب")));
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                          top: 30,
                          bottom: 10,
                          left: 20,
                          right: 20,
                        ),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: AppColors.blueGradient,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Center(
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: Text(
                                  ' حساب جديد',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerRight,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: Text(
                                  'الاسم كامل ',
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            TextField(
                              keyboardType: TextInputType.text,

                              controller: fullNameController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: '  احمد محمد علي  ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: Text(
                                  'كلمه السر',
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            TextField(
                              controller: passwordController,
                              obscureText: obscurePassword,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: ' ........',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscurePassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      obscurePassword = !obscurePassword;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: Text(
                                  ' الايميل',
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            TextField(
                              controller: emailController,
                              keyboardType: TextInputType.text,

                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: 'ahmed12@gamil.com',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: Text(
                                  ' رقم الجوال',
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            TextField(
                              keyboardType: TextInputType.phone,

                              controller: phoneController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: '01202837983 ',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: SlideTransition(
                                position: _slideAnimation,
                                child: Text(
                                  ' تاريخ الميلاد',
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 5.h),
                            TextField(
                              keyboardType: TextInputType.text,

                              controller: birthdateController,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey[200],
                                hintText: 'DD - MM -YYY',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            DefaultButton(
                              text: " انشاء حساب",
                              function: () {
                                final name = fullNameController.text.trim();
                                final email = emailController.text.trim();
                                final password = passwordController.text.trim();
                                final phone = phoneController.text.trim();
                                final birthdate =
                                    birthdateController.text.trim();

                                if (name.isEmpty ||
                                    email.isEmpty ||
                                    password.isEmpty ||
                                    phone.isEmpty ||
                                    birthdate.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text("يرجى ملء جميع الحقول"),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                                if (!RegExp(r'^\d{11}$').hasMatch(phone)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "رقم الجوال يجب أن يكون مكونًا من 11 رقمًا",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                if (!RegExp(
                                  r'^[^@]+@[^@]+\.[^@]+',
                                ).hasMatch(email)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "البريد الإلكتروني غير صالح",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                if (password.length < 6) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "كلمة المرور يجب أن تكون على الأقل 6 أحرف",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                BlocProvider.of<RegisterCubit>(
                                  context,
                                ).registerPatient(
                                  fullName: name,
                                  email: email,
                                  password: password,
                                  phoneNumber: phone,
                                  birthday: birthdate,
                                  imageBytes: Uint8List(0),
                                );
                              },
                            ),

                            SizedBox(height: 50.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SlideTransition(
                                  position: _slideAnimation,
                                  child: Text(
                                    "هل لديك حساب بالفعل؟",
                                    style: GoogleFonts.leagueSpartan(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w300,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                    );
                                  },
                                  child: SlideTransition(
                                    position: _slideAnimation,
                                    child: Text(
                                      "تسجيل الدخول",
                                      style: GoogleFonts.leagueSpartan(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w300,
                                        color: AppColors.mainColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
