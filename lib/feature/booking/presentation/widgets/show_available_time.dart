import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/booking/data/models/booking_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DoctorAvailabilityWidget extends StatefulWidget {
  final DoctorAvailabilityModel availability;
  final Function(String?) onSessionTypeSelected;
  final Function(AvailableSlot?) onTimeSlotSelected;

  const DoctorAvailabilityWidget({
    super.key,
    required this.availability,
    required this.onSessionTypeSelected,
    required this.onTimeSlotSelected,
  });

  @override
  State<DoctorAvailabilityWidget> createState() => _DoctorAvailabilityWidgetState();
}

class _DoctorAvailabilityWidgetState extends State<DoctorAvailabilityWidget> {
  String? _selectedSessionType; 
  AvailableSlot? _selectedSlot;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainColor.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSessionTypes(),
                  SizedBox(height: 20.h),
                  _buildDayDetails(),
                  SizedBox(height: 16.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.mainColor,
            AppColors.mainColor.withOpacity(0.8),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.availability.date ?? 'No Date',
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          if (widget.availability.consultationPrice != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: Colors.white.withOpacity(0.3),
                  width: 1,
                ),
              ),
              child: Text(
                '${widget.availability.consultationPrice} EGP',
                style: GoogleFonts.leagueSpartan(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSessionTypes() {
    if (widget.availability.availableSessionTypes == null || 
        widget.availability.availableSessionTypes!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.h),
        Text(
          'Available Session Types',
          style: GoogleFonts.leagueSpartan(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.greyColor,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(height: 8.h),
        Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: widget.availability.availableSessionTypes!
              .where((type) => ['Video', 'Call'].contains(type)) // Filter out 'Chat'
              .map((type) {
            final isSelected = _selectedSessionType == type;
            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSessionType = isSelected ? null : type;
                  widget.onSessionTypeSelected(_selectedSessionType);
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  gradient: isSelected
                      ? LinearGradient(
                          colors: [
                            AppColors.mainColor,
                            AppColors.mainColor.withOpacity(0.8),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                  color: isSelected ? null : AppColors.mainColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isSelected ? AppColors.mainColor : AppColors.mainColor.withOpacity(0.2),
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Text(
                  type,
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 12.sp,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? Colors.white : AppColors.mainColor,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDayDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.availability.dayDetails?.map((dayDetail) {
            return Container(
              margin: EdgeInsets.only(bottom: 20.h),
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16.r),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 4.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(2.r),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        dayDetail.day ?? 'No Day',
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  _buildInfoRow(
                    icon: Icons.access_time_rounded,
                    label: 'Time',
                    value: '${dayDetail.startTime} - ${dayDetail.endTime}',
                  ),
                  SizedBox(height: 8.h),
                  _buildInfoRow(
                    icon: Icons.timer_outlined,
                    label: 'Duration',
                    value: '${dayDetail.consultationDurationMinutes ?? 0} mins',
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'الاوقات المتاحة',
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyColor,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  _buildAvailableSlots(dayDetail.availableSlots),
                ],
              ),
            );
          }).toList() ??
          [
            Container(
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.info_outline,
                    color: AppColors.greyColor,
                    size: 20.sp,
                  ),
                  SizedBox(width: 8.w),
                  Text(
                    'No day details available',
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 14.sp,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16.sp,
          color: AppColors.greyColor,
        ),
        SizedBox(width: 8.w),
        Text(
          '$label: ',
          style: GoogleFonts.leagueSpartan(
            fontSize: 13.sp,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: GoogleFonts.leagueSpartan(
            fontSize: 13.sp,
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }

  Widget _buildAvailableSlots(List<AvailableSlot>? slots) {
    if (slots == null || slots.isEmpty) {
      return Container(
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              Icons.event_busy,
              color: AppColors.greyColor,
              size: 18.sp,
            ),
            SizedBox(width: 8.w),
            Text(
              'No available slots',
              style: GoogleFonts.leagueSpartan(
                fontSize: 14.sp,
                color: AppColors.greyColor,
              ),
            ),
          ],
        ),
      );
    }

    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: slots.map((slot) {
        final isSelected = _selectedSlot == slot;
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedSlot = isSelected ? null : slot;
              widget.onTimeSlotSelected(_selectedSlot);
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
            decoration: BoxDecoration(
              gradient: isSelected
                  ? LinearGradient(
                      colors: [
                        AppColors.mainColor,
                        AppColors.mainColor.withOpacity(0.8),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isSelected ? null : Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: isSelected ? AppColors.mainColor : Colors.grey.shade300,
                width: isSelected ? 2 : 1,
              ),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AppColors.mainColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${slot.startTime} - ${slot.endTime}',
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : Colors.black87,
                  ),
                ),
                if (slot.sessionType != null) ...[
                  SizedBox(height: 2.h),
                  Text(
                    slot.sessionType!,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 10.sp,
                      color: isSelected
                          ? Colors.white.withOpacity(0.9)
                          : AppColors.greyColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}