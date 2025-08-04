import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/notifications/firebase_messaging_service.dart';
import 'package:consult_me/core/notifications/flutter_local_notification.dart';
import 'package:consult_me/doctor/auth/presentation/logic/cubit/login_cubit.dart';
import 'package:consult_me/doctor/auth/presentation/logic/cubit/login_state.dart';
import 'package:consult_me/doctor/auth/presentation/pages/widget/custom_forgetpassword.dart';
import 'package:consult_me/doctor/privacy/presentation/screens/privacy_one_doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:consult_me/core/Network/local/secure_storage.dart';

class LoginPageScreen extends StatefulWidget {
  
  const LoginPageScreen({super.key,});

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool rememberMe = false;
  bool obscurePassword = true;
   final formKey = GlobalKey<FormState>();

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
    _loadSavedCredentials();
  }

  
  Future<void> _loadSavedCredentials() async {
    final savedEmail = await SharedPreferencesService.read(
      SharedPreferencesService.email,
    );
    final savedPassword = await SharedPreferencesService.read(
      SharedPreferencesService.password,
    );

    if (savedEmail != null && savedPassword != null) {
      emailController.text = savedEmail;
      passwordController.text = savedPassword;
      setState(() {
        rememberMe = true;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>GetIt.instance<LoginCubit>(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => PrivacyOneDoctor(user:state.data),
                ),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Header
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          width: double.infinity,
                          height: 100,
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
                                  child: const Text(
                                    'تسجيل دخول',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              const Positioned(
                                right: 0,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 40.h),
                
                        // Form Section
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: SlideTransition(
                                  position: _slideAnimation,
                                  child: Text(
                                    'مرحبا',
                                    style: GoogleFonts.leagueSpartan(
                                      fontSize: 24.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              Align(
                                alignment: Alignment.centerRight,
                                child: SlideTransition(
                                  position: _slideAnimation,
                                  child: Text(
                                    'سجّل دخولك للوصول إلى خدماتك الصحية بكل سهولة وأمان. صحتك تبدأ هنا',
                                    style: GoogleFonts.leagueSpartan(
                                      fontSize: 14.sp,
                                      color: AppColors.greyColor,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ),
                              SizedBox(height: 40.h),
                
                              // Email
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'البريد الإلكتروني',
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextFormField(
                                 validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'يرجى إدخال البريد الإلكتروني';
                                  }
                                  if (!value.contains('@')) {
                                    return 'البريد الإلكتروني غير صالح';
                                  }
                                  return null;
                                },
                                controller: emailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: 'ahmed12@gmail.com',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  
                                ),
                                
                              ),
                              SizedBox(height: 10.h),
                
                              // Password
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'كلمة السر',
                                  style: GoogleFonts.leagueSpartan(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.greyColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'يرجى إدخال كلمة السر';
                                  }
                                  if (value.length < 6) {
                                    return 'يجب أن تكون كلمة السر 6 أحرف على الأقل';
                                  }
                                  return null;
                                },
                                controller: passwordController,
                                obscureText: obscurePassword,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: '........',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide.none,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      obscurePassword
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        obscurePassword = !obscurePassword;
                                      });
                                    },
                                  ),
                                ),
                              ),
                
                             
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: rememberMe,
                                        onChanged: (value) {
                                          setState(() {
                                            rememberMe = value!;
                                          });
                                        },
                                      ),
                                      Text(
                                        "تذكرني",
                                        style: GoogleFonts.leagueSpartan(
                                          fontSize: 14.sp,
                                          color: AppColors.greyColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                CustomForgetpassword(),

                                ],
                              ),
                              SizedBox(height: 30.h),
                
                              // Login Button
                              SizedBox(
                                width: double.infinity,
                                height: 50.h,
                                child: ElevatedButton(
                                  onPressed: () {
                                   if (formKey.currentState!.validate()) {
                                      BlocProvider.of<LoginCubit>(context).login(
                                        email: emailController.text.trim(),
                                        password: passwordController.text.trim(),
                                        rememberMe: rememberMe,
                                      );
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.mainColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  child:
                                      state is AuthLoading
                                          ? const CircularProgressIndicator(
                                            color: Colors.white,
                                          )
                                          : Text(
                                            'تسجيل الدخول',
                                            style: GoogleFonts.leagueSpartan(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
