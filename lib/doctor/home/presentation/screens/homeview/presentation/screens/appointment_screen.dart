import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AppointmentScreen extends StatelessWidget {
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.only(right: 20.h),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios, color: AppColors.mainColor),),
                 
                  SizedBox(width: 100.w),
                  Text(
                    "المواعيد",
                    style: GoogleFonts.leagueSpartan(
                      color: AppColors.mainColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5.h),
            Divider(),
            SizedBox(height: 10.h),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: "البحث باسم المريض",
                        hintStyle: GoogleFonts.leagueSpartan(
                          color: Color(0xff747474),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColors.mainColor,
                        ),

                        fillColor: AppColors.greyColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),

                          borderSide: BorderSide(color: AppColors.mainColor),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color(0xffD9D9D9),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
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
            SizedBox(height: 10.h),
            const Expanded(child: OrdersScreen()),
          ],
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
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 1
                                ? Color(0xff14C8C7)
                                : Colors.transparent,
                        borderRadius:
                            selectedIndex == 1
                                ? BorderRadius.circular(16)
                                : BorderRadius.zero,
                      ),
                      child: Center(
                        child: Text(
                          " اليوم",
                          style: GoogleFonts.leagueSpartan(
                            color:
                                selectedIndex == 1
                                    ? Colors.white
                                    : AppColors.mainColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 0
                                ? Color(0xff14C8C7)
                                : Colors.transparent,
                        borderRadius:
                            selectedIndex == 0
                                ? BorderRadius.circular(16)
                                : BorderRadius.zero,
                      ),
                      child: Center(
                        child: Text(
                          "المواعيد",
                          style: GoogleFonts.leagueSpartan(
                            color:
                                selectedIndex == 0
                                    ? Colors.white
                                    : AppColors.mainColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                      decoration: BoxDecoration(
                        color:
                            selectedIndex == 2
                                ? Color(0xff14C8C7)
                                : Colors.transparent,
                        borderRadius:
                            selectedIndex == 2
                                ? BorderRadius.circular(16)
                                : BorderRadius.zero,
                      ),
                      child: Center(
                        child: Text(
                          "سجل",
                          style: TextStyle(
                            color:
                                selectedIndex == 2
                                    ? Colors.white
                                    : AppColors.mainColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 50.h),
        Expanded(
          child:
              selectedIndex == 0
                  ? buildCurrentOrders()
                  : selectedIndex == 1
                  ? buildPreviousOrders()
                  : ListView.builder(
                    itemCount: 5, // Change this count as needed
                    itemBuilder: (context, index) {
                      return buildCanceledOrders();
                    },
                  ),
        ),
      ],
    );
  }
}

Widget buildPreviousOrders() {
  return Column(
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
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        "قم بتحديث أيام وساعات عملك",
        style: GoogleFonts.leagueSpartan(
          color: Color(0xff747474),
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        "لتستقبل المواعيد المختلفة",
        style: GoogleFonts.leagueSpartan(
          color: Color(0xff747474),
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

Widget buildCurrentOrders() {
  return Column(
    children: [
      Lottie.asset(
        "assets/lottie/Animation - 1746698994206.json",
        width: 180.w,
        height: 180.h,
      ),

      Text(
        "ليس لديك مواعيد اليوم",
        style: GoogleFonts.leagueSpartan(
          color: AppColors.mainColor,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        "قم بتحديث أيام وساعات عملك",
        style: GoogleFonts.leagueSpartan(
          color: Color(0xff747474),
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
      Text(
        "لتستقبل المواعيد المختلفة",
        style: GoogleFonts.leagueSpartan(
          color: Color(0xff747474),
          fontSize: 15.sp,
          fontWeight: FontWeight.w700,
        ),
      ),
    ],
  );
}

Widget buildCanceledOrders() {
  return Padding(
    padding: const EdgeInsets.only(right: 20, left: 20, top: 10),
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xffD9D9D9)),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                child: Icon(Icons.person, color: Colors.black),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ليلي محمد",
                    style: TextStyle(
                      color: AppColors.mainColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.home, color: AppColors.mainColor),
                      SizedBox(width: 4.w),
                      Text(
                        "رساله",
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
              Spacer(),
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
          SizedBox(height: 8),
          Divider(),
          SizedBox(height: 5.h),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "متابعه",
                  style: TextStyle(
                    color: AppColors.wightcolor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "انثي",
                  style: TextStyle(
                    color: AppColors.wightcolor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(width: 30),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "٢٨سنه",
                  style: TextStyle(
                    color: AppColors.wightcolor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Divider(),
          SizedBox(height: 8.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      "الزمن",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 9, 9, 10),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "21-3",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
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
                      "حاله الموعد",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 9, 9, 10),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "تم بنجاح",
                      style: TextStyle(
                        color: AppColors.mainColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
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
                      "حاله الدفع",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 9, 9, 10),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "تم الانتهاء",
                      style: TextStyle(
                        color: AppColors.mainColor,
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
}
