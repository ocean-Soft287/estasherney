import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/searchappoint/searchAppontment_cubit.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/logic/searchappoint/searchappointment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearch extends StatefulWidget {
  CustomSearch({super.key});

  @override
  State<CustomSearch> createState() => _CustomSearchState();
}

class _CustomSearchState extends State<CustomSearch> {
  final TextEditingController searchController = TextEditingController();

  String getTimeRemainingText(String date, String startTime, String endTime) {
    try {
      final start = DateTime.parse(
        "$date ${startTime.length == 5 ? '$startTime:00' : startTime}",
      );
      final end = DateTime.parse(
        "$date ${endTime.length == 5 ? '$endTime:00' : endTime}",
      );
      final now = DateTime.now();

      if (now.isAfter(end)) return "الموعد انتهى";
      if (now.isAfter(start) && now.isBefore(end)) return "الموعد جاري الآن";

      final diff = start.difference(now);
      final hours = diff.inHours;
      final minutes = diff.inMinutes.remainder(60);

      return "المتبقي: ${hours} ساعة و ${minutes} دقيقة";
    } catch (e) {
      return "خطأ في توقيت الموعد";
    }
  }

  IconData getSessionIcon(String type) {
    switch (type.toLowerCase()) {
      case 'video':
        return Icons.videocam;
      case 'chat':
        return Icons.chat;
      case 'call':
        return Icons.call;
      default:
        return Icons.help_outline;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    setState(() {
                      searchController.text = value;
                    });
                    final cubit = context.read<SearchAppointmentCubit>();
                    if (value.trim().isEmpty) {
                      cubit.clearSearch();
                    } else {
                      cubit.search(value.trim());
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "البحث باسم المريض",
                    hintStyle: GoogleFonts.leagueSpartan(
                      color: const Color(0xff747474),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon:
                        searchController.text.isNotEmpty
                            ? IconButton(
                              onPressed: () {
                                setState(() {
                                  searchController.text = '';
                                });
                              },
                              icon: const Icon(
                                Icons.clear,
                                color: AppColors.mainColor,
                              ),
                            )
                            : null,
                    prefixIcon: Icon(Icons.search, color: AppColors.mainColor),
                    fillColor: AppColors.greyColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: AppColors.mainColor),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xffD9D9D9),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: AppColors.mainColor,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                        "الفلترة",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.mainColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        BlocBuilder<SearchAppointmentCubit, SearchAppointmentState>(
          builder: (context, state) {
            if (state is SearchAppointmentLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SearchAppointmentFailure) {
              return Center(child: Text("خطأ: ${state.error}"));
            } else if (state is SearchAppointmentSuccess) {
              final appointments = state.appointments;

              if (appointments.isEmpty) {
                return const Center(child: Text("لا يوجد نتائج."));
              }

              return SizedBox(
                height: MediaQuery.of(context).size.height * 0.58,
                child: ListView.builder(
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    final item = appointments[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 6,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xffD9D9D9)),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  backgroundColor: Colors.blueGrey,
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: 8.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.fullName,
                                      style: TextStyle(
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
                                          item.sessionType,
                                          style: TextStyle(
                                            color: AppColors.mainColor,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "السجلات",
                                    style: TextStyle(
                                      color: AppColors.mainColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                buildChip("متابعة"),
                                SizedBox(width: 10.w),
                                buildChip(item.gender.toString()),
                                SizedBox(width: 10.w),
                                buildChip("${item.age} سنة"),
                              ],
                            ),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text("الزمن"),
                                      Text(
                                        getTimeRemainingText(
                                          item.date,
                                          item.slotStartTime,
                                          item.slotEndTime,
                                        ),
                                        style: TextStyle(
                                          color: AppColors.mainColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 30.w),
                                Expanded(
                                  child: Column(
                                    children: [
                                      const Text("حالة الدفع"),
                                      Text(
                                        item.status.toString(),
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16.sp,
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
                    );
                  },
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget buildChip(String text) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: AppColors.wightcolor,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.mainColor),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: const Color(0xff747474),
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
