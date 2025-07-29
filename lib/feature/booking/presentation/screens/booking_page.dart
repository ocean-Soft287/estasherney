import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/booking/data/models/booking_model.dart';
import 'package:consult_me/feature/booking/presentation/widgets/attachment_section_booking_widget.dart';
import 'package:consult_me/feature/booking/presentation/widgets/available_times_section.dart';
import 'package:consult_me/feature/booking/presentation/widgets/confirm_button_booking_widget.dart';
import 'package:consult_me/feature/booking/presentation/widgets/doctor_name_card_widget.dart';
import 'package:consult_me/feature/booking/presentation/widgets/image_pick_function.dart';
import 'package:consult_me/feature/booking/presentation/widgets/patient_details_section_widget.dart';
import 'package:consult_me/feature/booking/presentation/widgets/personal_info_section.dart';
import 'package:consult_me/feature/booking/presentation/widgets/section_title.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../cubit/booking_cubit.dart';
import '../cubit/booking_state.dart';
import 'package:get_it/get_it.dart' as db;

// Design System Constants
class BookingDesignSystem {
  static const double cardRadius = 16.0;
  static const double buttonRadius = 12.0;
  static const double spacing = 16.0;
  static const double smallSpacing = 8.0;
  static const double largeSpacing = 24.0;
  
  static EdgeInsets get pagePadding => EdgeInsets.symmetric(horizontal: 20.w);
  static EdgeInsets get sectionPadding => EdgeInsets.all(16.r);
}

class BookingPage extends StatefulWidget {
  final DoctorModel doctor;

  const BookingPage({super.key, required this.doctor});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> with TickerProviderStateMixin {
  int selectedDateIndex = 1;
  int selectedTimeIndex = -1;
  String fullName = "";
  String age = "";
  String gender = "ذكر";
  String problemDescription = "";
  bool isSelfSelected = true;

  late AnimationController _fadeController;
  late AnimationController _slideController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _slideController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeOutCubic,
    ));

    _fadeController.forward();
    _slideController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  List<String> get dates {
    final List<String> dateList = [];
    final DateTime now = DateTime.now();
    for (int i = 0; i < 6; i++) {
      final DateTime date = now.add(Duration(days: i));
      dateList.add(DateFormat('yyyy-MM-dd').format(date));
    }
    return dateList;
  }

  String convertArabicToEnglishNumber(String arabicNumber) {
    const arabicDigits = '٠١٢٣٤٥٦٧٨٩';
    const englishDigits = '0123456789';

    String result = arabicNumber;
    for (int i = 0; i < arabicDigits.length; i++) {
      result = result.replaceAll(arabicDigits[i], englishDigits[i]);
    }

    return result;
  }

  List<String> get days {
    final List<String> dayList = [];
    final DateTime now = DateTime.now();
    for (int i = 0; i < 7; i++) {
      final DateTime date = now.add(Duration(days: i));
      dayList.add(_getArabicDayName(date.weekday));
    }
    return dayList;
  }

  String _getArabicDayName(int weekday) {
    switch (weekday) {
      case 1: return "الإثنين";
      case 2: return "الثلاثاء";
      case 3: return "الأربعاء";
      case 4: return "الخميس";
      case 5: return "الجمعة";
      case 6: return "السبت";
      case 7: return "الأحد";
      default: return "غير معروف";
    }
  }

 

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => db.GetIt.instance<BookingCubit>(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: FadeTransition(
          opacity: _fadeAnimation,
          child: BlocBuilder<BookingCubit, BookingState>(
            builder: (context, state) {
              final cubit = context.watch<BookingCubit>();
              return CustomScrollView(
                slivers: [
                  _buildHeader(cubit: cubit),
                  SliverToBoxAdapter(
                    child: SlideTransition(
                      position: _slideAnimation,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         if(state is GtBookingAvailableSuccess) AvailableTimesSection(state:  state,
                          onSessionSelected: (String? session) {  }, onSlotSelected: (AvailableSlot? slot) {  },),
                          _buildPatientDetailsSection(),
                          PersonalInfoSection(fullName: fullName, age: age,
                           problemDescription: problemDescription, selectedGender: gender,
                            onNameChanged: (name){}, onAgeChanged: (age){}, onProblemChanged: (problem){},
                             onGenderSelected: (gender){}),
                      //    _buildPersonalInfoSection(),
                         AttachmentsSectionWidget(onFileTap: () {  
                         final file =    pickFile();
                         }, onImageTap: () {
                          final image =    pickImage();

                           },),
                     
                         ConfirmButtonWidget(onPressed: () {  },),
                         // _buildConfirmButton(),
                          SizedBox(height: 30.h),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildHeader({required BookingCubit cubit}) {
    return SliverAppBar(
      expandedHeight: 260.h,
      floating: false,
      pinned: false,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: AppColors.blueGradient,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30.r),
            bottomRight: Radius.circular(30.r),
          ),
        ),
        child: FlexibleSpaceBar(
          background: Padding(
            padding: EdgeInsets.fromLTRB(20.w, 50.h, 20.w, 20.h),
            child: Column(
              children: [
                _buildHeaderTop(),
                SizedBox(height: 20.h),
                _buildScheduleText(),
                SizedBox(height: 20.h),
                _buildDateSelector(cubit: cubit),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderTop() {
    return Row(
      children: [
        _buildBackButton(),
        Expanded(
          child: Center(
            child:DoctorNameCard(doctorName: widget.doctor.name ),
          ),
        ),
        SizedBox(width: 40.w), // Balance the back button
      ],
    );
  }

  Widget _buildBackButton() {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.r),
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 18.w,
            color: Colors.white,
          ),
        ),
      ),
    );
  }


  Widget _buildScheduleText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "الجدول الزمني القادم",
          style: GoogleFonts.leagueSpartan(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "الشهر",
          style: GoogleFonts.leagueSpartan(
            fontSize: 16.sp,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildDateSelector({required BookingCubit cubit}) {
    return Container(
      height: 80.h,
      child: Row(
        children: [
          _buildArrowButton(
            icon: Icons.arrow_back_ios,
            isVisible: selectedDateIndex > 0,
            onPressed: () {
              setState(() {
                if (selectedDateIndex > 0) selectedDateIndex--;
                cubit.getBooking(
                  date: convertArabicToEnglishNumber(dates[selectedDateIndex]),
                  doctorId: widget.doctor.id.toString(),
                );
              });
            },
          ),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              separatorBuilder: (_, __) => SizedBox(width: 12.w),
              itemBuilder: (context, index) {
                return _buildDateCard(index, cubit: cubit);
              },
            ),
          ),
          _buildArrowButton(
            icon: Icons.arrow_forward_ios,
            isVisible: selectedDateIndex < dates.length - 1,
            onPressed: () {
              setState(() {
                if (selectedDateIndex < dates.length - 1) selectedDateIndex++;
                cubit.getBooking(
                  date:'29-07-2025', //convertArabicToEnglishNumber(dates[selectedDateIndex]),
                  doctorId:'37' // widget.doctor.id.toString(),
                );
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildArrowButton({
    required IconData icon,
    required bool isVisible,
    required VoidCallback onPressed,
  }) {
    return Visibility(
      visible: isVisible,
      child: Container(
        width: 36.w,
        height: 36.w,
        margin: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(18.r),
            onTap: onPressed,
            child: Icon(
              icon,
              color: Colors.white,
              size: 16.w,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateCard(int index, {required BookingCubit cubit}) {
    final isSelected = selectedDateIndex == index;
    
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 60.w,
      height: 75.h,
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
        boxShadow: isSelected
            ? [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: () {
            setState(() {
              selectedDateIndex = index;
                 cubit.getBooking(
                  date:'2025-07-29', //convertArabicToEnglishNumber(dates[selectedDateIndex]),
                  doctorId:'37' // widget.doctor.id.toString(),
                );

            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                days[index],
                style: GoogleFonts.leagueSpartan(
                  color: isSelected ? AppColors.mainColor : Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                DateFormat('dd').format( DateTime.parse(convertArabicToEnglishNumber(dates[index])) ) , // Display only day
                style: GoogleFonts.leagueSpartan(
                  color: isSelected ? AppColors.mainColor : Colors.white,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  
  Widget _buildPatientDetailsSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      padding: BookingDesignSystem.sectionPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(BookingDesignSystem.cardRadius.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(title:  "تفاصيل المريض"),
          SizedBox(height: 16.h),
        PatientDetailsSection(isSelfSelected: isSelfSelected, onSelectionChanged: (onSelectionChanged){
          isSelfSelected = onSelectionChanged;
          setState(() {
            
          });
        })
        ],
      ),
    );
  }






}