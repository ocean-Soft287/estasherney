import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/book_now.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedDateIndex = 1; // Default selected date
  int selectedTimeIndex = -1; // No time selected initially
  String fullName = "";
  String age = "";
  String gender = "ذكر";
  String problemDescription = "";

  final List<String> dates = ["10", "11", "12", "13", "14"];
  final List<String> days = [
    "الأحد",
    "الإثنين",
    "الثلاثاء",
    "الأربعاء",
    "الخميس",
  ];
  final List<String> times = [
    "9:00 ص",
    "10:00 ص",
    "11:30 ص",
    "2:00 م",
    "3:00 م",
    "9:00 ص",
    "10:00 ص",
    "11:30 ص",
    "2:00 م",
    "3:00 م",
  ];
  bool isSelfSelected = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 230,
                width: double.infinity,
                padding: EdgeInsets.all(15.w),
                decoration: BoxDecoration(
                  gradient: AppColors.blueGradient,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 2,
                      right: 0,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.wightcolor,
                      ),
                    ),
                    Positioned(
                      top: 2,
                      left: 10,
                      child: Image.asset("assets/images/Group 50.png"),
                    ),
                    Positioned(
                      top: 2,
                      left: 35,
                      child: Image.asset("assets/images/Group 51.png"),
                    ),
                    Positioned(
                      top: 2,
                      left: 60,
                      child: Image.asset("assets/images/Group 52.png"),
                    ),
                    Positioned(
                      right: 20,
                      top: 2,
                      child: Container(
                        padding: EdgeInsets.all(3),
                        width: 120,
                        height: 25,
                        decoration: BoxDecoration(
                          color: AppColors.wightcolor,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          "د/ محمد فتحي",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 60,
                      right: 10,
                      child: Text(
                        "الجدول الزمني القادم",
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Positioned(
                      top: 60,
                      left: 10,
                      child: Text(
                        "الشهر ",
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2,
                      left: 80,
                      child: Icon(
                        Icons.question_mark,
                        color: AppColors.wightcolor,
                      ),
                    ),
                    Positioned(
                      top: 2,
                      left: 100,
                      child: Icon(
                        Icons.favorite_outline_outlined,
                        color: AppColors.wightcolor,
                      ),
                    ),

                    Positioned(
                      top: 80,
                      left: 10,
                      child: Image.asset('assets/images/Rectangle 129.png'),
                    ),
                    SizedBox(height: 15.h),
                    Positioned(
                      right: 10,
                      top: 125,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Visibility(
                              visible: selectedDateIndex > 0,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (selectedDateIndex > 0)
                                      selectedDateIndex--;
                                  });
                                },
                              ),
                            ),

                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(dates.length, (
                                    index,
                                  ) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 5.w,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedDateIndex = index;
                                          });
                                        },
                                        child: Container(
                                          width: 50.w,
                                          height: 70.h,
                                          decoration: BoxDecoration(
                                            color:
                                                selectedDateIndex == index
                                                    ? Colors.white
                                                    : Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 1.5,
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                days[index],
                                                style: TextStyle(
                                                  color:
                                                      selectedDateIndex == index
                                                          ? AppColors.mainColor
                                                          : Colors.white,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5.h),
                                              Text(
                                                dates[index],
                                                style: TextStyle(
                                                  color:
                                                      selectedDateIndex == index
                                                          ? AppColors.mainColor
                                                          : Colors.white,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            ),

                            Visibility(
                              visible: selectedDateIndex < dates.length - 1,
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (selectedDateIndex < dates.length - 1)
                                      selectedDateIndex++;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "الوقت المتاح",
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.mainColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Wrap(
                  spacing: 10.w,
                  runSpacing: 10.w,

                  children: List.generate(times.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTimeIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 10.h,
                        ),
                        decoration: BoxDecoration(
                          color:
                              selectedTimeIndex == index
                                  ? AppColors.mainColor
                                  : Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color:
                                selectedTimeIndex == index
                                    ? Colors.blue.shade700
                                    : Colors.grey,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          times[index],
                          style: TextStyle(
                            fontSize: 16.sp,
                            color:
                                selectedTimeIndex == index
                                    ? Colors.white
                                    : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "تفاصيل المريض",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        setState(() {
                          isSelfSelected = true;
                        });
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.purple),
                        backgroundColor:
                            isSelfSelected
                                ? AppColors.mainColor
                                : Colors.white, // ✅ لون الخلفية عند التحديد
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        "نفسك",
                        style: TextStyle(
                          color: isSelfSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(width: 5),

                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isSelfSelected = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isSelfSelected
                                ? Colors.white
                                : AppColors
                                    .mainColor, // ✅ لون الخلفية عند التحديد
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                            color: AppColors.mainColor,
                          ), // ✅ تحديد الإطار عند التحديد
                        ),
                      ),
                      child: Text(
                        "شخص آخر",
                        style: TextStyle(
                          color:
                              isSelfSelected
                                  ? Colors.black
                                  : Colors
                                      .white, // ✅ تغيير لون النص عند التحديد
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  " الاسم كامل",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "محمد فتحي ",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onChanged: (value) => setState(() => fullName = value),
                ),
              ),

              SizedBox(height: 10.h),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  " العمر ",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.mainColor,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "23",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => setState(() => age = value),
                ),
              ),

              SizedBox(height: 10.h),

              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text("الجنس:", style: TextStyle(fontSize: 16.sp)),
                    SizedBox(width: 10.w),
                    ChoiceChip(
                      selectedColor: AppColors.mainColor,
                      label: Text(
                        "ذكر",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.blackColor,
                        ),
                      ),

                      selected: gender == "ذكر",
                      onSelected: (selected) {
                        if (selected) setState(() => gender = "ذكر");
                      },
                    ),
                    SizedBox(width: 10.w),
                    ChoiceChip(
                      selectedColor: AppColors.mainColor,
                      label: Text(
                        "أنثى",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.blackColor,
                        ),
                      ),
                      selected: gender == "أنثى",
                      onSelected: (selected) {
                        if (selected) setState(() => gender = "أنثى");
                      },
                    ),
                    SizedBox(width: 10.w),
                    ChoiceChip(
                      selectedColor: AppColors.mainColor,
                      label: Text(
                        "طفل",
                        style: GoogleFonts.leagueSpartan(
                          color: AppColors.blackColor,
                        ),
                      ),

                      selected: gender == "طفل",
                      onSelected: (selected) {
                        if (selected) setState(() => gender = "طفل");
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.h),

              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "اكتب المشكلة هنا...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  maxLines: 3,
                  onChanged:
                      (value) => setState(() => problemDescription = value),
                ),
              ),

              SizedBox(height: 20.h),

              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ResetBooKNow()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    padding: EdgeInsets.all(10),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                  ),
                  child: Text(
                    "تأكيد",
                    style: TextStyle(fontSize: 18.sp, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
