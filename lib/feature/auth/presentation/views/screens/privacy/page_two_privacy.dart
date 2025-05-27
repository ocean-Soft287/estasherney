import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/feature/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PageTwoPrivacy extends StatefulWidget {
  const PageTwoPrivacy({super.key});

  @override
  State<PageTwoPrivacy> createState() => _PageTwoPrivacyState();
}

class _PageTwoPrivacyState extends State<PageTwoPrivacy>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late AnimationController _cardController;
  late Animation<Offset> _cardSlideAnimation;

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

    _cardController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _cardSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _cardController, curve: Curves.easeInOut),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.reset();
    _controller.forward();

    _cardController.reset();
    _cardController.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _cardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                  left: 20,
                  right: 20,
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
                        child: Text(
                          'سياسة الخصوصية',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(1, 1),
                                blurRadius: 2,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      right: 0,
                      child: Icon(Icons.arrow_back_ios, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              SlideTransition(
                position: _cardSlideAnimation,
                child: SizedBox(
                  height: 190,
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(0.9),
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'سادسًا: الحجز وتعديل المواعيد',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'يمكن للمريض تعديل أو إلغاء الموعد من خلال التطبيق ',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'وفق سياسة الاسترداد المذكورة.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'إذا قام الطبيب بتغيير الموعد، يتم إخطار المريض',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'مع إمكانية قبول الموعد الجديد أو استرداد المبلغ المدفوع.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SlideTransition(
                position: _cardSlideAnimation,
                child: SizedBox(
                  height: 190,
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(0.9),
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'سابعًا: الخصومات والعروض',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'يتيح التطبيق خصومات خاصة لبعض الفئات (مثل المؤسسات الخيرية ',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'والحالات الاجتماعية)',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'لا يمكن الجمع بين أكثر من عرض أو خصم على نفس الاستشارة.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'الخصومات قابلة للتغيير والتحديث دون إشعار مسبق.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              SlideTransition(
                position: _cardSlideAnimation,
                child: SizedBox(
                  height: 190,
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(0.9),
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'ثامنًا: التعاملات خارج التطبيق',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'يخلي التطبيق مسؤوليته الكاملة عن أي تواصل أو تعامل مالي',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'أو طبي يتم خارج نطاق التطبيق.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'أي اتفاق خارجي لا يخضع لسياسات التطبيق ولا يضمنه بأي شكل.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'ننصح بإتمام كل التعاملات داخل المنصة لضمان الحماية والجودة.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              SlideTransition(
                position: _cardSlideAnimation,
                child: SizedBox(
                  height: 150,
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(0.9),
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'تاسعًا: التحديثات على السياسات',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'يحتفظ التطبيق بحقه الكامل في تعديل أو تحديث هذه السياسات ',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'في أي وقت.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              SlideTransition(
                position: _cardSlideAnimation,
                child: SizedBox(
                  height: 300,
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.black.withOpacity(0.9),
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'عاشرًا: سياسة ملفات تعريف الارتباط (Cookies)',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'واستخدام المعلومات',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'يستخدم التطبيق ملفات تعريف الارتباط (Cookies)',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'لتحسين تجربة المستخدم، مثل حفظ التفضيلات ',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'وتحليل الأداء وغيرها.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'يتم جمع بعض البيانات (مثل نوع الجهاز، النظام، ',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'الصفحات المستخدمة وسن المستخدم ونوعه) ',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'لتحسين الخدمات.',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'تُستخدم المعلومات لأغراض تحليلية داخلية',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 5, left: 5),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              'وتطوير الخدمات فقط، ولا يتم مشاركتها مع أي جهة خارجية ',
                              style: GoogleFonts.leagueSpartan(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: AppColors.mainColor,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DefaultButton(
                    width: 146,
                    heightButton: 40,
                    textColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    text: "موافق",
                    function: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 10.w),
                  DefaultButton(
                    width: 146,
                    heightButton: 40,
                    textColor: Colors.white,
                    backgroundColor: AppColors.whitegradient,
                    text: "غير موافق",
                    function: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
