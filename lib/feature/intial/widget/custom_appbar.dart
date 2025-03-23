import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Align(
        alignment: Alignment.centerRight, 
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
              Image.asset("assets/images/Back # 4.png"),
              SizedBox(width: 10.w,),
            Text(
              "تخطي",
              style: GoogleFonts.leagueSpartan(
                fontWeight: FontWeight.w300,
                color: AppColors.mainColor,
                fontSize: 15.sp,
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
