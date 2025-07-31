import 'package:consult_me/patient/booking/data/models/booking_model.dart';
import 'package:consult_me/patient/booking/presentation/cubit/booking_state.dart';
import 'package:consult_me/patient/booking/presentation/screens/booking_page.dart';
import 'package:consult_me/patient/booking/presentation/widgets/section_title.dart';
import 'package:consult_me/patient/booking/presentation/widgets/show_available_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AvailableTimesSection extends StatelessWidget {
  final GtBookingAvailableSuccess state;
  final void Function(String? session) onSessionSelected;
  final void Function(AvailableSlot? slot) onSlotSelected;

  const AvailableTimesSection( {
    super.key,
    required this.state,
    required this.onSessionSelected,
    required this.onSlotSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          const SectionTitle(title: "الوقت المتاح"),
          SizedBox(height: 10.h),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: state.data.isEmpty
                  ? const Center(child: Text('لا يوجد مواعيد'))
                  : DoctorAvailabilityWidget(
                      availability: state.data.first,
                      onSessionTypeSelected: onSessionSelected,
                      onTimeSlotSelected: onSlotSelected,
                    ),
            )
        ],
      ),
    );
  }
}
