
  import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildMenuItem(IconData icon, String title,VoidCallback  ontap) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
          ,color: AppColors.mainColor
        ),
        child: Icon(icon,color:  AppColors.wightcolor)),
      title: Text(
        title,
        style: GoogleFonts.leagueSpartan(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w400
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16,color: AppColors.mainColor,),
      onTap: ontap
        
      
    );
  }

