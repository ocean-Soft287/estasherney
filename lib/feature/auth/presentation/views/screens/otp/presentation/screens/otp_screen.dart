import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/screens/login_screen.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/otp/presentation/logic/otp_cubit.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/otp/presentation/logic/otp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyOtpScreen extends StatelessWidget {
  const VerifyOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<VerifyOtpCubit>(),
      child: const VerifyOtpView(),
    );
  }
}

class VerifyOtpView extends StatefulWidget {
  const VerifyOtpView({super.key});

  @override
  State<VerifyOtpView> createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends State<VerifyOtpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("تأكيد الكود")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "من فضلك أدخل الإيميل والكود المرسل",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: "الإيميل"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'من فضلك أدخل الإيميل';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              PinCodeTextField(
                appContext: context,
                length: 6,
                controller: otpController,
                autoDismissKeyboard: true,
                keyboardType: TextInputType.number,
                onChanged: (_) {},
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                ),
              ),

              const SizedBox(height: 20),

              BlocConsumer<VerifyOtpCubit, VerifyOtpState>(
                listener: (context, state) {
                  if (state is VerifyOtpSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم التحقق بنجاح')),
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginScreen()),
                    );
                  
                  } else if (state is VerifyOtpFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message)),
                    );
                  }
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is VerifyOtpLoading
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              context.read<VerifyOtpCubit>().verifyOtp(
                                    email: emailController.text.trim(),
                                    token: otpController.text.trim(),
                                  );
                            }
                          },
                    child: state is VerifyOtpLoading
                        ? const CircularProgressIndicator()
                        : const Text("تأكيد"),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
