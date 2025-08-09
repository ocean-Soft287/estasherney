import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import '../../../../../../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../../../../../../features/call/presentation/cubit/call_cubit.dart';
import '../data/models/doctor_future_appointment.dart';
import '../logic/appointment_day_cubit/appointment_day_cubit.dart';
import '../logic/appointment_day_cubit/appointment_day_state.dart';
import '../logic/appointmentdoctor_future_cubit/appointment_future_cubit.dart';
import '../logic/appointmentdoctor_future_cubit/appointment_future_state.dart';
import '../logic/appointmentpast/appointment_past_cubit.dart';
import '../logic/appointmentpast/appointment_past_state.dart';
import '../logic/searchappoint/searchAppontment_cubit.dart';
import '../logic/searchappoint/searchappointment_state.dart';
import '../widget/custom_search.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => GetIt.I<SearchAppointmentCubit>()),
            BlocProvider(create: (context) => GetIt.I<CallCubit>()),
          ],
          child: BlocBuilder<SearchAppointmentCubit, SearchAppointmentState>(
            builder: (context, state) {
              final isSearching =
                  state is SearchAppointmentSuccess ||
                      state is SearchAppointmentLoading ||
                      state is SearchAppointmentFailure;

              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.mainColor.withOpacity(0.05),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.mainColor.withOpacity(0.1),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: AppColors.mainColor,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "المواعيد",
                                style: GoogleFonts.leagueSpartan(
                                  color: AppColors.mainColor,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const Spacer(),
                              SizedBox(width: 48.w),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          height: 1,
                          margin: EdgeInsets.symmetric(horizontal: 20.w),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                AppColors.mainColor.withOpacity(0.3),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        CustomSearch(),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ),
                  if (!isSearching) const Expanded(child: OrdersScreen()),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            height: 56.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: AppColors.mainColor.withOpacity(0.1),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                _buildTab("اليوم", 1),
                _buildTab("المواعيد", 0),
                _buildTab("سجل", 2),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.1, 0),
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              ),
            ),
            child: selectedIndex == 0
                ? const PreviousOrdersEmptyWidget(key: ValueKey('future'))
                : selectedIndex == 1
                ? const CurrentAppointmentsScreen(key: ValueKey('current'))
                : const CanceledOrderCard(key: ValueKey('past')),
          ),
        ),
      ],
    );
  }

  Widget _buildTab(String label, int index) {
    final isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => selectedIndex = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.mainColor : Colors.transparent,
            borderRadius: BorderRadius.circular(14.r),
            boxShadow: isSelected
                ? [
              BoxShadow(
                color: AppColors.mainColor.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ]
                : null,
          ),
          child: Center(
            child: Text(
              label,
              style: GoogleFonts.leagueSpartan(
                color: isSelected ? Colors.white : AppColors.mainColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

mixin AppointmentCardHelper {
  Widget getTimeRemainingText(String date, String startTime, String endTime) {
    return _CountdownTimerWidget(
      date: date,
      startTime: startTime,
      endTime: endTime,
    );
  }

  bool isSessionActive(String date, String startTime, String endTime) {
    try {
      final start = DateTime.parse(
        "$date ${startTime.length == 5 ? '$startTime:00' : startTime}",
      );
      final end = DateTime.parse(
        "$date ${endTime.length == 5 ? '$endTime:00' : endTime}",
      );
      final now = DateTime.now();
      return now.isAfter(start) && now.isBefore(end);
    } catch (e) {
      return false;
    }
  }

  IconData getSessionIcon(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return Icons.videocam;
      case 'chat':
        return Icons.chat_bubble_outline;
      case 'call':
        return Icons.call;
      default:
        return Icons.help_outline;
    }
  }

  String getSessionNameArabic(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return 'فيديو';
      case 'chat':
        return 'محادثة';
      case 'call':
        return 'اتصال';
      default:
        return 'غير معروف';
    }
  }

  String getArabicPaymentStatus(String status) {
    switch (status.toLowerCase()) {
      case 'paid':
        return 'تم الدفع';
      case 'unpaid':
        return 'لم يتم الدفع';
      default:
        return 'غير معروف';
    }
  }

  String getArabicGender(String gender) {
    switch (gender.toLowerCase()) {
      case 'male':
        return 'ذكر';
      case 'female':
        return 'أنثى';
      default:
        return 'غير محدد';
    }
  }

  Color getPaymentStatusColor(String status) {
    return status.toLowerCase() == 'paid' ? Colors.green : Colors.orange;
  }
}

class _CountdownTimerWidget extends StatefulWidget {
  final String date;
  final String startTime;
  final String endTime;

  const _CountdownTimerWidget({
    required this.date,
    required this.startTime,
    required this.endTime,
  });

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<_CountdownTimerWidget> {
  Timer? _timer;
  String _displayText = "جاري الحساب...";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    try {
      final start = DateTime.parse(
        "${widget.date} ${widget.startTime.length == 5 ? '${widget.startTime}:00' : widget.startTime}",
      );
      final end = DateTime.parse(
        "${widget.date} ${widget.endTime.length == 5 ? '${widget.endTime}:00' : widget.endTime}",
      );

      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!mounted) {
          timer.cancel();
          return;
        }
        final now = DateTime.now();

        if (now.isAfter(end)) {
          setState(() => _displayText = "الموعد انتهى");
          timer.cancel();
          return;
        }
        if (now.isAfter(start) && now.isBefore(end)) {
          setState(() => _displayText = "الموعد جاري الآن");
          return;
        }

        final diff = start.difference(now);
        final days = diff.inDays;
        final hours = diff.inHours.remainder(24);
        final minutes = diff.inMinutes.remainder(60);
        final seconds = diff.inSeconds.remainder(60);

        final parts = <String>[];
        if (days > 0) parts.add("$days يوم");
        if (hours > 0) parts.add("$hours ساعة");
        if (minutes > 0) parts.add("$minutes دقيقة");
        if (seconds > 0 || parts.isEmpty) parts.add("$seconds ثانية");

        setState(() => _displayText = "المتبقي: ${parts.join(' و ')}");
      });
    } catch (e) {
      setState(() => _displayText = "خطأ في توقيت الموعد");
      _timer?.cancel();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayText,
      style: GoogleFonts.leagueSpartan(
        color: AppColors.mainColor,
        fontSize: 13.sp,
        fontWeight: FontWeight.w600,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class PreviousOrdersEmptyWidget extends StatelessWidget with AppointmentCardHelper {
  const PreviousOrdersEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AppointmentFutureCubit>(),
      child: BlocConsumer<AppointmentFutureCubit, ApointmentFutureState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AppointmentFutureLoading) {
            return _loadingIndicator();
          }

          if (state is AppointmentFutureFailure ||
              (state is AppointmentFutureSuccess && state.model.data.isEmpty)) {
            return _emptyState();
          }

          if (state is AppointmentFutureSuccess) {
            final appointments = state.model.data;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final PastAppointmentData item = appointments[index];
                return _buildAppointmentCard(context, item: item);
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _loadingIndicator() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: AppColors.mainColor, strokeWidth: 3),
          SizedBox(height: 16.h),
          Text(
            "جاري التحميل...",
            style: GoogleFonts.leagueSpartan(
              color: AppColors.mainColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyState() {
    return Center(
      child: Container(
        padding: EdgeInsets.all(30.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              "assets/lottie/Animation - 1746698444784.json",
              width: 150.w,
              height: 150.h,
            ),
            SizedBox(height: 20.h),
            Text(
              "ليس لديك مواعيد اليوم",
              style: GoogleFonts.leagueSpartan(
                color: AppColors.mainColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "قم بتحديث أيام وساعات عملك",
              style: GoogleFonts.leagueSpartan(
                color: AppColors.mainColor.withOpacity(0.7),
                fontSize: 15.sp,
              ),
            ),
            Text(
              "لتستقبل المواعيد المختلفة",
              style: GoogleFonts.leagueSpartan(
                color: AppColors.mainColor.withOpacity(0.7),
                fontSize: 15.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context, {required PastAppointmentData item}) {
    final isActive = isSessionActive(item.date, item.slotStartTime, item.slotEndTime);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainColor.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50.w,
                  height: 50.w,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.mainColor,
                        AppColors.mainColor.withOpacity(0.7),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.fullName,
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  getSessionIcon(item.sessionType),
                                  color: AppColors.mainColor,
                                  size: 16.sp,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  getSessionNameArabic(item.sessionType),
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.mainColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.r),
                          onTap: () {

                            // DateTime start = DateTime.parse("${item.date} ${item.slotStartTime}");
                            // DateTime end = DateTime.parse("${item.date} ${item.slotEndTime}");
                            // Duration diff = end.difference(start);
                            // context.read<CallCubit>().startCall(
                            //   targetUserId: item.patientId,
                            //   durationInMinutes: diff.inMinutes,
                            // );
                            //
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            child: Text(
                              "السجلات",
                              style: GoogleFonts.leagueSpartan(
                                color: AppColors.mainColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.mainColor.withOpacity(0.1) : Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.r),
                          onTap: isActive
                              ? () {
                            DateTime start = DateTime.parse("${item.date} ${item.slotStartTime}");
                            DateTime end = DateTime.parse("${item.date} ${item.slotEndTime}");
                            Duration diff = end.difference(start);
                            context.read<CallCubit>().startCall(
                              targetUserId: item.patientId,
                              durationInMinutes: diff.inMinutes,
                            );
                          }
                              : null,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            child: Text(
                              "انضم الان",
                              style: GoogleFonts.leagueSpartan(
                                color: isActive ? AppColors.mainColor : Colors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Divider(color: AppColors.mainColor.withOpacity(0.2)),
            SizedBox(height: 12.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 8.h,
              children: [
                _buildTag("متابعة", Colors.blue),
                _buildTag(getArabicGender(item.gender), Colors.purple),
                _buildTag("${item.age} سنة", Colors.orange),
              ],
            ),
            SizedBox(height: 12.h),
            Divider(color: AppColors.mainColor.withOpacity(0.2)),
            SizedBox(height: 12.h),
            Row(
              children: [
                Expanded(
                  child: _buildInfoBox(
                    "الزمن",
                    getTimeRemainingText(
                      item.date,
                      item.slotStartTime,
                      item.slotEndTime,
                    ),
                    AppColors.mainColor,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildInfoBox(
                    "حالة الدفع",
                    getArabicPaymentStatus(item.status),
                    getPaymentStatusColor(item.status),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTag(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.leagueSpartan(
          color: color,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildInfoBox(String title, dynamic value, Color color) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.leagueSpartan(
              color: Colors.grey.shade600,
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          value is Widget
              ? value
              : Text(
            value.toString(),
            style: GoogleFonts.leagueSpartan(
              color: color,
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class CurrentAppointmentsScreen extends StatelessWidget with AppointmentCardHelper {
  const CurrentAppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<AppointmentCubit>(),
      child: BlocConsumer<AppointmentCubit, AppointmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is AppointmentLoading) {
            return _loadingIndicator();
          }

          if (state is AppointmentFailure ||
              (state is AppointmentSuccess && state.model.data.isEmpty)) {
            return _emptyState();
          }

          if (state is AppointmentSuccess) {
            final appointments = state.model.data;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final item = appointments[index];
                return _buildAppointmentCard(context, item);
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _loadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _emptyState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            "assets/lottie/Animation - 1746698444784.json",
            width: 180.w,
            height: 180.h,
          ),
          Text(
            "ليس لديك مواعيد اليوم",
            style: GoogleFonts.leagueSpartan(
              color: AppColors.mainColor,
              fontSize: 18.sp,
            ),
          ),
          Text(
            "قم بتحديث أيام وساعات عملك",
            style: GoogleFonts.leagueSpartan(
              color: AppColors.mainColor,
              fontSize: 15.sp,
            ),
          ),
          Text(
            "لتستقبل المواعيد المختلفة",
            style: GoogleFonts.leagueSpartan(
              color: AppColors.mainColor,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentCard(BuildContext context, dynamic item) {
    final isActive = isSessionActive(item.date, item.slotStartTime, item.slotEndTime);

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.blueGrey,
                  child: Icon(Icons.person, color: Colors.black),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.fullName,
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            getSessionIcon(item.sessionType),
                            color: AppColors.mainColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            getSessionNameArabic(item.sessionType),
                            style: GoogleFonts.leagueSpartan(
                              color: AppColors.mainColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.mainColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.r),
                          onTap: () {
                            DateTime start = DateTime.parse("${item.date} ${item.slotStartTime}");
                            DateTime end = DateTime.parse("${item.date} ${item.slotEndTime}");
                            Duration diff = end.difference(start);
                            context.read<CallCubit>().startCall(
                              targetUserId: item.patientId,
                              durationInMinutes: diff.inMinutes,
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            child: Text(
                              "السجلات",
                              style: GoogleFonts.leagueSpartan(
                                color: AppColors.mainColor,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      decoration: BoxDecoration(
                        color: isActive ? AppColors.mainColor.withOpacity(0.1) : Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.r),
                          onTap: isActive
                              ? () {
                            DateTime start = DateTime.parse("${item.date} ${item.slotStartTime}");
                            DateTime end = DateTime.parse("${item.date} ${item.slotEndTime}");
                            Duration diff = end.difference(start);
                            context.read<CallCubit>().startCall(
                              targetUserId: item.patientId,
                              durationInMinutes: diff.inMinutes,
                            );
                          }
                              : null,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 8.h,
                            ),
                            child: Text(
                              "انضم الان",
                              style: GoogleFonts.leagueSpartan(
                                color: isActive ? AppColors.mainColor : Colors.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 12.h),
            const Divider(),
            SizedBox(height: 8.h),
            Wrap(
              spacing: 10.w,
              runSpacing: 6.h,
              children: [
                _chip("متابعة", Colors.blue),
                _chip(getArabicGender(item.gender), Colors.purple),
                _chip("${item.age} سنة", Colors.orange),
              ],
            ),
            SizedBox(height: 10.h),
            const Divider(),
            SizedBox(height: 10.h),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "الزمن",
                        style: GoogleFonts.leagueSpartan(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      getTimeRemainingText(
                        item.date,
                        item.slotStartTime,
                        item.slotEndTime,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.w),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "حالة الدفع",
                        style: GoogleFonts.leagueSpartan(
                          color: Colors.black,
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        getArabicPaymentStatus(item.status),
                        style: GoogleFonts.leagueSpartan(
                          color: getPaymentStatusColor(item.status),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _chip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.leagueSpartan(
          color: color,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}

class CanceledOrderCard extends StatelessWidget with AppointmentCardHelper {
  const CanceledOrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<PastAppointmentCubit>()..getPastAppointments(),
      child: BlocConsumer<PastAppointmentCubit, PastAppointmentState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is PastAppointmentLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PastAppointmentFailure ||
              (state is PastAppointmentSuccess && state.appointments.isEmpty)) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    "assets/lottie/Animation - 1746698444784.json",
                    width: 180.w,
                    height: 180.h,
                  ),
                  Text(
                    "ليس لديك مواعيد سابقة",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 18.sp,
                    ),
                  ),
                  Text(
                    "المواعيد ستظهر هنا",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            );
          }

          if (state is PastAppointmentSuccess) {
            final appointments = state.appointments;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final item = appointments[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            backgroundColor: Colors.blueGrey,
                            child: Icon(Icons.person, color: Colors.black),
                          ),
                          SizedBox(width: 12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.fullName,
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 16.sp,
                                  ),
                                ),
                                Text(
                                  getSessionNameArabic(item.sessionType),
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.grey,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                            ),
                            child: Text(
                              "السجلات",
                              style: GoogleFonts.leagueSpartan(
                                color: AppColors.mainColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 12.h),
                      const Divider(),
                      SizedBox(height: 8.h),
                      Wrap(
                        spacing: 10.w,
                        runSpacing: 6.h,
                        children: [
                          _chip("مكتمل", Colors.green),
                          _chip(getArabicGender(item.gender), Colors.purple),
                          _chip("${item.age} سنة", Colors.orange),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      const Divider(),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "الزمن",
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "${item.date} - ${item.slotStartTime}",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  "الحالة",
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  "منتهي",
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.green,
                                    fontSize: 14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _chip(String label, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: GoogleFonts.leagueSpartan(
          color: color,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}