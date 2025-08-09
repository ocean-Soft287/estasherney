
import 'dart:async';

import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/notifications/notification_push.dart';
import 'package:consult_me/features/call/presentation/cubit/call_cubit.dart';
import 'package:consult_me/features/call/presentation/pages/video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../data/models/my_call_model.dart';
import '../cubit/call_state.dart';

class MyCalls extends StatefulWidget {
  const MyCalls({super.key});

  @override
  State<MyCalls> createState() => _MyCallsState();
}

class _MyCallsState extends State<MyCalls> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _timer = Timer.periodic(const Duration(seconds: 60), (_) {
       GetIt.instance<CallCubit>().getAllCallForPatient();
      });
      // Fetch calls when the page loads


    });

  }

  @override
  void deactivate() {
    _controller.dispose();
    _timer.cancel();
    super.deactivate();
  }
  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<CallCubit>()..getAllCallForPatient(),
      child:
      Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: AppColors.mainColor, size: 20.sp),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "مكالماتي",
            style: GoogleFonts.leagueSpartan(
              color: AppColors.mainColor,
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<CallCubit, CallState>(
          builder: (context, state) {
            if (state is GetAllMyCallsLoading) {
              return _buildLoadingIndicator();
            }

            if (state is CallFailure || (state is GetAllMyCallsSuccess && state.calls.isEmpty)) {
              return _buildEmptyState();
            }

            if (state is GetAllMyCallsSuccess) {
              final calls = state.calls;
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                itemCount: calls.length,
                itemBuilder: (context, index) {
                  final call = calls[index];
                  return _buildCallCard(context, call);
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),

    );
  }

  /// Displays a loading indicator during data fetching.
  Widget _buildLoadingIndicator() {
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

  /// Displays an empty state when no calls are available.
  Widget _buildEmptyState() {
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
              "لا توجد مكالمات",
              style: GoogleFonts.leagueSpartan(
                color: AppColors.mainColor,
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "المكالمات النشطة ستظهر هنا",
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

  /// Builds a card for each call with details and a join button if active.
  Widget _buildCallCard(BuildContext context, MyCallModel call) {
    final isActive = call.endedAt == null;
    final startTime = call.startedAt != null
        ? "${call.startedAt!.hour.toString().padLeft(2, '0')}:${call.startedAt!.minute.toString().padLeft(2, '0')}"
        : "غير محدد";

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
                    Icons.call,
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
                        "مكالمة مع الطبيب #${call.doctorId ?? 'غير معروف'}",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Text(
                        "المدة: ${call.durationInMinutes ?? 0} دقيقة",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor.withOpacity(0.7),
                          fontSize: 14.sp,
                        ),
                      ),

                      SizedBox(height: 4.h),
                      Text(
                        "رقم المكالمة: ${call.id ?? 0} ",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor.withOpacity(0.7),
                          fontSize: 14.sp,
                        ),
                      ),

                    ],
                  ),
                ),
                if (isActive)
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
                      //  context.read<CallCubit>().  sendNotification(id: call.patientId!,call: call);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  Video(call: call),
                            ),
                          );

                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 8.h,
                          ),
                          child: Text(
                            "انضم الآن",
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
              ],
            ),
            SizedBox(height: 12.h),
            Divider(color: AppColors.mainColor.withOpacity(0.2)),
            SizedBox(height: 8.h),
            Row(
              children: [
                Expanded(
                  child: _buildInfoBox(
                    "وقت البدء",
                    startTime,
                    AppColors.mainColor,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildInfoBox(
                    "الحالة",
                    isActive ? "نشط" : "منتهي",
                    isActive ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a styled info box for call details.
  Widget _buildInfoBox(String title, String value, Color color) {
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
          Text(
            value,
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