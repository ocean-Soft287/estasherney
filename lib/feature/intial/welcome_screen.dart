import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/doctor/auth/presentation/pages/login_page_screen.dart';
import 'package:consult_me/feature/auth/presentation/views/screens/login/presentation/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _imageTwoController;
  late AnimationController _textController;

  late Animation<Offset> _logoAnimation;
  late Animation<Offset> _imageTwoAnimation;
  late Animation<Offset> _textAnimation;

  @override
  void initState() {
    super.initState();

    _logoController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _logoAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

    _imageTwoController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _imageTwoAnimation = Tween<Offset>(
      begin: const Offset(-1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _imageTwoController, curve: Curves.easeOut),
    );

    _textController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _textAnimation = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _textController, curve: Curves.easeOut));

    _logoController.forward().whenComplete(() {
      Future.delayed(const Duration(milliseconds: 200), () {
        _imageTwoController.forward().whenComplete(() {
          Future.delayed(const Duration(milliseconds: 200), () {
            _textController.forward();
          });
        });
      });
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _imageTwoController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SlideTransition(
                position: _logoAnimation,
                child: Image.asset("assets/images/logo.png"),
              ),

              SlideTransition(
                position: _imageTwoAnimation,
                child: Image.asset("assets/images/image_two.png"),
              ),

              SizedBox(height: 40.h),

              SlideTransition(
                position: _textAnimation,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "صحتك أولويتنا، وراحتك هدفنا. نحن هنا لمساعدتك في رحلتك نحو حياة أكثر صحة وسعادة",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultButton(
                  text: "تسجيل الدخول",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: DefaultButton(
                  text: "الدخول  كدكتور",
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPageScreen(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
