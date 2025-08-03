import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/profile_view.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/screens/setting/presentation/logic/update_profile_cubit.dart';
import 'package:consult_me/patient/home/presentation/views/screens/profile/screens/setting/presentation/logic/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController birthdateController;
  PlatformFile? selectedImage;
  String? imageUrl, hintName, hintPhone, hintBirthdate;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    phoneController = TextEditingController();
    birthdateController = TextEditingController();
    _loadUserData();
  }

  void _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      hintName = prefs.getString("fullName") ?? "";
      hintPhone = prefs.getString("phoneNumber") ?? "";
      hintBirthdate = prefs.getString("birthday") ?? "";
      imageUrl = prefs.getString("imageUrl") ?? "";
    });
  }

  void _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        selectedImage = result.files.first;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final name = nameController.text.trim();
      final phone = phoneController.text.trim();
      final birthdate = birthdateController.text.trim();
      context.read<UpdateProfileCubit>().updateProfile(
        fullname: name,
        phonenumber: phone,
        birthdate: birthdate,
        imageUrl: selectedImage != null ? selectedImage!.path! : "",
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wightcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        title: Text(
          'تعديل الملف الشخصي',
          style: GoogleFonts.leagueSpartan(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.wightcolor,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 25.sp,
            color: AppColors.wightcolor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is GetProfileSuccess) {
            SharedPreferences.getInstance().then((prefs) {
              prefs.setString("fullName", state.model.fullName);
              prefs.setString("phoneNumber", state.model.phoneNumber);
              prefs.setString("birthday", state.model.birthday);
              if (selectedImage != null) {
                prefs.setString("imageUrl", state.model.imageUrl);
              }
            });
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()),
            );
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text("تم تعديل البروفايل بنجاح")));
          } else if (state is ProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("فشل التحديث: ${state.errorMessage}")),
            );
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Center(
                  child: Stack(
                    children: [
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          radius: 60.r,
                          backgroundColor: AppColors.mainColor.withOpacity(
                            0.15,
                          ),
                          backgroundImage:
                              selectedImage != null
                                  ? FileImage(File(selectedImage!.path!))
                                  : imageUrl != null && imageUrl!.isNotEmpty
                                  ? NetworkImage(imageUrl!)
                                  : null,
                          child:
                              selectedImage == null &&
                                      (imageUrl == null || imageUrl!.isEmpty)
                                  ? Icon(
                                    Icons.add_a_photo,
                                    size: 36.r,
                                    color: AppColors.mainColor,
                                  )
                                  : null,
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          width: 32.r,
                          height: 32.r,
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.wightcolor,
                              width: 2,
                            ),
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 16.r,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24.h),

                Text(
                  "الاسم الكامل",
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: hintName ?? "أدخل اسمك الكامل",
                    hintStyle: GoogleFonts.leagueSpartan(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator: (value) => value!.isEmpty ? "الاسم مطلوب" : null,
                  style: GoogleFonts.leagueSpartan(fontSize: 15.sp),
                ),
                SizedBox(height: 18.h),

                Text(
                  "رقم الهاتف",
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: hintPhone ?? "أدخل رقم الهاتف",
                    hintStyle: GoogleFonts.leagueSpartan(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                        width: 1.5,
                      ),
                    ),
                  ),
                  validator:
                      (value) => value!.isEmpty ? "رقم الهاتف مطلوب" : null,
                  style: GoogleFonts.leagueSpartan(fontSize: 15.sp),
                ),
                SizedBox(height: 18.h),

                Text(
                  "تاريخ الميلاد",
                  style: GoogleFonts.leagueSpartan(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackColor,
                  ),
                ),
                SizedBox(height: 8.h),
                TextFormField(
                  controller: birthdateController,
                  decoration: InputDecoration(
                    hintText: hintBirthdate ?? "اختر تاريخ الميلاد",
                    hintStyle: GoogleFonts.leagueSpartan(
                      fontSize: 14.sp,
                      color: Colors.black54,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide(
                        color: AppColors.mainColor,
                        width: 1.5,
                      ),
                    ),
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      size: 20.sp,
                      color: AppColors.mainColor,
                    ),
                  ),
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final picked = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null) {
                      birthdateController.text =
                          "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
                    }
                  },
                  validator:
                      (value) => value!.isEmpty ? "تاريخ الميلاد مطلوب" : null,
                  style: GoogleFonts.cairo(fontSize: 15.sp),
                ),
                SizedBox(height: 32.h),

                SizedBox(
                  height: 50.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.r),
                      ),
                      elevation: 4,
                      shadowColor: AppColors.mainColor.withOpacity(0.3),
                    ),
                    onPressed: _submit,
                    child: Text(
                      "تحديث البيانات",
                      style: GoogleFonts.leagueSpartan(
                        fontSize: 16.sp,
                        color: AppColors.wightcolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
