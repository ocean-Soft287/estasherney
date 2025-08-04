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
  late final String firstName;
  late final String specialist;
  late final String? imageUrl;


  static const double _imageSizeRatio = 0.25;
  static const double _paddingRatio = 0.025;
  static const double _spacingRatio = 0.03;
  static const double _nameTextSizeRatio = 0.035;
  static const double _specialistTextSizeRatio = 0.03;
  static const double _iconSize = 24.0;

  @override
  void initState() {
    super.initState();

    imageUrl = widget.user.doctorImage;
    firstName = widget.user.name;
    specialist = widget.user.specialization;
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * _paddingRatio,
        vertical: screenWidth * 0.02,
      ),
      child: Row(
        children: [
         
          ClipRRect(
            borderRadius: BorderRadius.circular(
              screenWidth * _imageSizeRatio * 0.5,
            ),
            child: Container(
              width: screenWidth * _imageSizeRatio,
              height: screenWidth * _imageSizeRatio,
              decoration: BoxDecoration(
                color: AppColors.mainColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(
                  screenWidth * _imageSizeRatio * 0.5,
                ),
                border: Border.all(
                  color: AppColors.mainColor.withOpacity(0.2),
                  width: 2,
                ),
              ),
              child:
                  imageUrl != null
                      ? Image.network(
                        imageUrl!,
                        width: screenWidth * _imageSizeRatio,
                        height: screenWidth * _imageSizeRatio,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.mainColor,
                              value:
                                  loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              color: AppColors.mainColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(
                                screenWidth * _imageSizeRatio * 0.5,
                              ),
                            ),
                            child: Icon(
                              Icons.person,
                              size: screenWidth * _imageSizeRatio * 0.6,
                              color: AppColors.mainColor,
                            ),
                          );
                        },
                      )
                      : Icon(
                        Icons.person,
                        size: screenWidth * _imageSizeRatio * 0.6,
                        color: AppColors.mainColor,
                      ),
            ),
          ),

          SizedBox(width: screenWidth * _spacingRatio),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  firstName,
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.mainColor,
                    fontSize: screenWidth * _nameTextSizeRatio,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  specialist,
                  style: GoogleFonts.leagueSpartan(
                    color: AppColors.mainColor.withOpacity(0.8),
                    fontSize: screenWidth * _specialistTextSizeRatio,
                    fontWeight: FontWeight.w600,
                    height: 1.2,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          SizedBox(width: screenWidth * _spacingRatio),

          Container(
            padding: EdgeInsets.all(screenWidth * 0.02),
            decoration: BoxDecoration(
              color: AppColors.mainColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(screenWidth * 0.02),
            ),
            child: Icon(
              Icons.favorite_outline,
              color: AppColors.mainColor,
              size: _iconSize,
            ),
          ),
        ],
      ),
    );
  }
}
