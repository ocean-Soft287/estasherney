import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/core/constants/app_fonts.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/doctor_rating.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/my_appointment.dart';
import 'package:consult_me/feature/doctors/presentation/view/screens/profiledoctor/presentation/manager/rating_summary_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/home/data/model/get_doctor_model_pationt.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/presentation/widget/custom_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetBooKNow extends StatelessWidget {
  final DoctorModel doctor;

  const ResetBooKNow({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: AppColors.blueGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          "الحجوزات",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            fontFamily: Appfonts.font,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 48),
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              Padding(
                padding: EdgeInsets.all(12),
                child: ListView.builder(
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppColors.wightcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      margin: EdgeInsets.only(bottom: 15),
                      child: Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                    doctor.doctorImage,
                                  ),
                                ),

                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      doctor.name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    Text(
                                      doctor.specialization,
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                BlocProvider(
                                  create:
                                      (context) =>
                                          GetIt.instance<DoctorRatingCubit>(),
                                  child: CustomRow(doctorId: doctor.id),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),

                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => MyAppointment(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                  child: Text(
                                    "تأكيد الحجز",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                OutlinedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                DoctorRating(doctor: doctor),
                                      ),
                                    );
                                  },
                                  child: Text("إضافة تقييم"),
                                ),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "القيمه:",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.mainColor,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  doctor.examPrice.toString(),
                                  style: GoogleFonts.leagueSpartan(
                                    color: Colors.black,
                                    fontSize: 15,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
