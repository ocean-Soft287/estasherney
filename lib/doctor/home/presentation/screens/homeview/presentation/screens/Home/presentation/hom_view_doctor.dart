import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:consult_me/doctor/home/presentation/screens/chat/presentation/screens/chat_screen.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/calender/presentation/screens/Calendar.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/widget/custom_header.dart';
import 'package:consult_me/doctor/home/presentation/screens/homeview/presentation/screens/Home/presentation/screens/appointmentscreen/screens/appointment_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomViewDoctor extends StatelessWidget {
  final LoginModel user;

  const HomViewDoctor({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.02),

              // Logo section
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: screenWidth * 0.1,
                    height: screenWidth * 0.1,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(
                        Icons.medical_services,
                        size: screenWidth * 0.1,
                        color: AppColors.mainColor,
                      );
                    },
                  ),
                ),
              ),

              CustomHeader(user: user),

              SizedBox(height: screenHeight * 0.02),

              
              Center(
                child: Text(
                  "لايوجد موعد قادم الأن",
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.mainColor,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

             
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppointmentScreen(),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(10),
                          splashColor: AppColors.wightcolor.withOpacity(0.1),
                          highlightColor: AppColors.wightcolor.withOpacity(
                            0.05,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.mainColor,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.mainColor.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/Vector (22).png",
                                  width: screenWidth * 0.15,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.schedule,
                                      size: screenWidth * 0.15,
                                      color: AppColors.wightcolor,
                                    );
                                  },
                                ),
                                SizedBox(height: screenWidth * 0.02),
                                Text(
                                  "مواعيدي",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.wightcolor,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: screenWidth * 0.03),

                   
                    Expanded(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => CalendarScreens(user: user),
                              ),
                            );
                          },
                          borderRadius: BorderRadius.circular(10),
                          splashColor: AppColors.wightcolor.withOpacity(0.1),
                          highlightColor: AppColors.wightcolor.withOpacity(
                            0.05,
                          ),
                          child: Container(
                            padding: EdgeInsets.all(screenWidth * 0.025),
                            width: screenWidth * 0.4,
                            height: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.mainColor,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.mainColor.withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/Group (5).png",
                                  width: screenWidth * 0.15,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.calendar_today,
                                      size: screenWidth * 0.15,
                                      color: AppColors.wightcolor,
                                    );
                                  },
                                ),
                                SizedBox(height: screenWidth * 0.06),
                                Text(
                                  "التقويم",
                                  style: GoogleFonts.leagueSpartan(
                                    color: AppColors.wightcolor,
                                    fontSize: screenWidth * 0.045,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: screenHeight * 0.03),

              // Chat card
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              //   child: Center(
              //     child: SizedBox(
              //       width: screenWidth * 0.4,
              //       child: Material(
              //         color: Colors.transparent,
              //         child: InkWell(
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => ChatSceeens(),
              //               ),
              //             );
              //           },
              //           borderRadius: BorderRadius.circular(10),
              //           splashColor: AppColors.wightcolor.withOpacity(0.1),
              //           highlightColor: AppColors.wightcolor.withOpacity(0.05),
              //           child: Container(
              //             padding: EdgeInsets.all(screenWidth * 0.025),
              //             width: screenWidth * 0.4,
              //             height: screenWidth * 0.4,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               color: AppColors.mainColor,
              //               boxShadow: [
              //                 BoxShadow(
              //                   color: AppColors.mainColor.withOpacity(0.3),
              //                   blurRadius: 8,
              //                   offset: const Offset(0, 4),
              //                 ),
              //               ],
              //             ),
              //             child: Column(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Image.asset(
              //                   "assets/images/Vector (23).png",
              //                   width: screenWidth * 0.15,
              //                   errorBuilder: (context, error, stackTrace) {
              //                     return Icon(
              //                       Icons.chat,
              //                       size: screenWidth * 0.15,
              //                       color: AppColors.wightcolor,
              //                     );
              //                   },
              //                 ),
              //                 SizedBox(height: screenWidth * 0.06),
              //                 Text(
              //                   "المحادثات",
              //                   style: GoogleFonts.leagueSpartan(
              //                     color: AppColors.wightcolor,
              //                     fontSize: screenWidth * 0.045,
              //                     fontWeight: FontWeight.w700,
              //                   ),
              //                   textAlign: TextAlign.center,
              //                   maxLines: 1,
              //                   overflow: TextOverflow.ellipsis,
              //                 ),
              //               ],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),

              SizedBox(height: screenHeight * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}
