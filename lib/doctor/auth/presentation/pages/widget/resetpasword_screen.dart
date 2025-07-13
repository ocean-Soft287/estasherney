import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/auth/presentation/logic/cubit/resetpassword/resetpassword_state.dart';
import 'package:consult_me/doctor/auth/presentation/logic/cubit/resetpassword/resetpasword_cubit.dart';
import 'package:consult_me/doctor/auth/presentation/pages/login_page_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_it/get_it.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final codeController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    codeController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _submitReset(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final code = codeController.text.trim();
      final password = passwordController.text.trim();

      context.read<ResetPasswordCubit>().resetPassword(
            email: email,
            token: code,
            newPassword: password,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ResetPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'إعادة تعيين كلمة السر',
            style: GoogleFonts.leagueSpartan(fontSize: 20.sp,
            color: AppColors.mainColor),
          ),
        ),
        body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
         listener: (context, state) {
  if (state is ResetPasswordSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("تم إعادة تعيين كلمة السر بنجاح")),
    );
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginPageScreen ()),
      (route) => false,
    );
  } else if (state is ResetPasswordFailure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(state.error)),
    );
  }
},

          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'البريد الإلكتروني',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل البريد الإلكتروني';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: codeController,
                      decoration: const InputDecoration(
                        labelText: 'كود التفعيل',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'من فضلك أدخل الكود';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15.h),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'كلمة المرور الجديدة',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'يجب أن تكون كلمة المرور 6 أحرف على الأقل';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state is ResetPasswordLoading
                            ? null
                            : () => _submitReset(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: state is ResetPasswordLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'إعادة تعيين كلمة السر',
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
