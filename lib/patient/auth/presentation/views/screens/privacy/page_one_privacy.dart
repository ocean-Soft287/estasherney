import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/widget/defualt_botton.dart';
import 'package:consult_me/patient/auth/presentation/views/screens/privacy/page_two_privacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PageOnePrivacy extends StatefulWidget {
  const PageOnePrivacy({super.key});

  @override
  State<PageOnePrivacy> createState() => _PageOnePrivacyState();
}

class _PageOnePrivacyState extends State<PageOnePrivacy>
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
                  height: 200,
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
                              'أولًا: خصوصية البيانات',
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
                              'نلتزم في تطبيق "استشيرني" بالحفاظ التام على سرية وخصوصية ',
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
                              'جميع البيانات الشخصية والصحية الخاصة بالمستخدمين.',
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
                              'لا يتم مشاركة أي معلومات مع أطراف ثالثة دون موافقة صريحة',
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
                              'من المريض، إلا إذا كان ذلك مطلوبًا بموجب القانون.',
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
                              'يتم تخزين البيانات باستخدام أنظمة حماية مشددة،',
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
                              'وتُستخدم فقط لتقديم الخدمة الطبية داخل التطبيق.',
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
                  height: 350,
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
                              'ثانيًا: سياسة استرداد المبالغ المدفوعة',
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
                              'يحق للمستخدم استرداد كامل المبلغ المدفوع في الحالات التالية:',
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
                              'إذا كانت الحالة الطبية تتطلب كشفًا سريريًا أو مناظرة مباشرة.',
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
                              'في حالات الطوارئ الطبية التي تستوجب التوجه الفوري',
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
                              'لأقرب مستشفى.',
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
                              'إذا تغيب الطبيب عن الحضور في الموعد المحدد للاستشارة.',
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
                              'إذا قام المريض بإلغاء الموعد قبل الموعد المحدد بـ 3 ساعات أو أكثر.',
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
                              'يحق للمستخدم استرداد 50% من المبلغ المدفوع في الحالة التالية:',
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
                              'إذا اعتذر المريض عن الموعد المحدد بمدة أقل من ٣ ساعات قبل',
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
                              'عن الموعد المحدد.',
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
                              'لا يحق للمستخدم استرداد أي مبلغ في الحالة التالية:',
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
                              'إذا تم الإلغاء أو الاعتذار أو عدم حضور الموعد بعد مرور ٣ ساعات',
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
                              'من الموعد المحدد.',
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
                  height: 200,
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
                              'ثالثًا: شروط استخدام التطبيق',
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
                              'يجب على المستخدم إنشاء حساب شخصي بمعلومات صحيحة',
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
                              'وتحديث بياناته باستمرار.',
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
                              'يُمنع استخدام التطبيق في أي أغراض غير طبية أو غير قانونية.',
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
                              'يتحمل المستخدم مسؤولية دقة المعلومات الصحية التي يقدمها، ',
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
                              'وتُبنى الاستشارة الطبية عليها.',
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
                  height: 200,
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
                              'رابعًا: مسئولية التطبيق',
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
                              'يقدم التطبيق استشارات طبية عن بُعد ولا يُغني ذلك عن',
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
                              'الفحص السريري عند الحاجة.',
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
                              'لا يتحمل التطبيق مسؤولية أي تشخيص خاطئ ناتج عن معلومات',
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
                              'ناقصة أو غير دقيقة من المريض.',
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
                              'الطبيب هو المسؤول عن التشخيص بناءً على البيانات التي توفرها له الاستشارة.',
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
                  height: 200,
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
                              'خامسًا: سياسة التواصل',
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
                              'يتم التواصل بين الطبيب والمريض فقط عبر التطبيق',
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
                              '(دردشة – مكالمة صوتية – مكالمة فيديو).',
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
                              'يُمنع تبادل أرقام الهواتف أو وسائل التواصل الاجتماعي',
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
                              'بين الطبيب والمريض.',
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
                              'يلتزم الطبيب بالحضور في الموعد المتفق عليه أو إخطار الإدارة ',
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
                              'في حال التعذر.',
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
                          builder: (context) => PageTwoPrivacy(),
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
