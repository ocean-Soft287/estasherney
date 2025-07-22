import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/logic/forgetpassword_pationt_cubit.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/logic/forgetpassword_pationt_screen.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/screens/resetpassword_pationt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgetpasswordPationtScreen extends StatefulWidget {
  const ForgetpasswordPationtScreen({super.key});

  @override
  State<ForgetpasswordPationtScreen> createState() => _ForgetpasswordPationtScreenState();
}

class _ForgetpasswordPationtScreenState extends State<ForgetpasswordPationtScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<ForgetpasswordPationtCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'نسيت كلمة السر',
            style: GoogleFonts.leagueSpartan(fontSize: 20.sp),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.w),
          child: BlocConsumer<ForgetpasswordPationtCubit, ForgetpasswordPationtScreenState>(
            listener: (context, state) {
              if (state is ForgetPasswordPationtSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("مراجعة البريد الإلكتروني لإعادة تعيين كلمة السر")),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ResetpasswordPationtScreen(),
                  ),
                );
              } else if (state is ForgetPasswordPationtFailure) {
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
                        onPressed: state is ForgetPasswordPationtLoading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<ForgetpasswordPationtCubit>().sendResetLink(
                                        emailController.text.trim(),
                                      );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                        ),
                        child: state is ForgetPasswordPationtLoading
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
