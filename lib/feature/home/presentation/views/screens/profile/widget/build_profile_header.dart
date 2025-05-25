import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BuildProfileHeader extends StatelessWidget {
  const BuildProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: AppColors.blueGradient,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Stack(
        children: [
          // Positioned widgets should be wrapped in a Stack for proper layout
          Positioned(
            top: 20,
            right: 20,
            child: Stack(
              clipBehavior: Clip.none, // Allows overflow outside Stack
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage("assets/images/doctor.png"),
                ),
                Positioned(
                  bottom: 0, 
                  right: 1, 
                  child: CircleAvatar(
                    radius: 15, 
                    backgroundColor: Colors.grey.shade300,
                    child: const Icon(Icons.edit, size: 16, color: AppColors.mainColor),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 80,
            top: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "محمد فتحي",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "0078754873",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "MohamedF@gmail.com",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          // Positioned Back Button
          Positioned(
            top: -7,
            right: 1,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
            
              },
            ),
          ),
        ],
      ),
    );
  }
}
