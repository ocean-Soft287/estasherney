import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/doctor/auth/data/model/login_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHeader extends StatefulWidget {
  final LoginModel user;
  const CustomHeader({super.key, required this.user});

  @override
  State<CustomHeader> createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  String? firstname;
  String? specialist;
  String? imageUrl;

  @override
  void initState() {
    imageUrl = widget.user.doctorImage;
    firstname = widget.user.name;
    specialist = widget.user.specialization;
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(
        right: screenWidth * 0.025,
        left: screenWidth * 0.025,
      ),
      child: Row(
        children: [
          Image.network(
           imageUrl!,
            width: screenWidth * 0.25,
            height: screenWidth * 0.25,
          ),
          SizedBox(width: screenWidth * 0.03),
          Column(
            children: [
              Text(
                firstname!,
                style: GoogleFonts.leagueSpartan(
                  color: AppColors.mainColor,
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
              specialist!,
                style: GoogleFonts.leagueSpartan(
                  color: AppColors.mainColor,
                  fontSize: screenWidth * 0.03,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.favorite_outline, color: AppColors.mainColor),
        ],
      ),
    );
  }
}
