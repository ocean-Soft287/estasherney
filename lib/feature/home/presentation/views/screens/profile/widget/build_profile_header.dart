import 'package:consult_me/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BuildProfileHeader extends StatefulWidget {
  const BuildProfileHeader({super.key});

  @override
  State<BuildProfileHeader> createState() => _BuildProfileHeaderState();
}

class _BuildProfileHeaderState extends State<BuildProfileHeader> {
  String? fullName;
  String? phone;
  String? email;
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    final firstName = prefs.getString('fullName') ?? '';

    final profileImage = prefs.getString('imageUrl') ?? '';
    final savedEmail = prefs.getString('email') ?? '';

    setState(() {
      fullName = firstName;

      email = savedEmail;
      imageUrl =
          profileImage.isNotEmpty
              ? "http://37.34.238.190:9292/TheOneAPIEstasherny//Images/Patient/$profileImage"
              : null;
    });
  }

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
          Positioned(
            top: 20,
            right: 20,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                CircleAvatar(
                  radius: 45,

                  backgroundImage:
                      imageUrl != null && imageUrl!.isNotEmpty
                          ? NetworkImage(imageUrl!)
                          : const AssetImage("assets/images/doctor.png")
                              as ImageProvider,
                ),
              ],
            ),
          ),
          Positioned(
            left: 80,
            top: 30,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName ?? "الاسم غير متوفر",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Text(
                  email ?? "البريد الإلكتروني غير متوفر",
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 1,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
