import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/auth/presentation/logic/fotgetpassword/forgetpassword_cubit.dart';
import 'package:consult_me/doctor/auth/presentation/logic/fotgetpassword/forgettpasword_state.dart';
import 'package:consult_me/doctor/auth/presentation/pages/resetpasword_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ForgetPasswordCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'نسيت كلمة السر',
            style: GoogleFonts.leagueSpartan(fontSize: 20.sp),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
              if (state is ForgetPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("مراجعة البريد الإلكتروني لإعادة تعيين كلمة السر")),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ResetPasswordScreen(),
                  ),
                );
              } else if (state is ForgetPasswordFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return Form(
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
                    SizedBox(height: 20.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state is ForgetPasswordLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<ForgetPasswordCubit>().sendResetLink(
                                        emailController.text.trim(),
                                      );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: state is ForgetPasswordLoading
                            ? const CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'إرسال كود التفعيل',
                                style: GoogleFonts.leagueSpartan(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
