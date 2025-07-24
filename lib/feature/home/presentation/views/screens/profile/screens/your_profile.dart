// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/build_header.dart';
// import 'package:consult_me/feature/home/presentation/views/screens/profile/widget/custom_card.dart';

// class YourProfile extends StatefulWidget {
//   const YourProfile({super.key});

//   @override
//   State<YourProfile> createState() => _YourProfileState();
// }

// class _YourProfileState extends State<YourProfile> {
//   String fullName = '';
//   String phone = '';
//   String email = '';
//   String birthDate = '';
//   String? imageUrl = "";

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       fullName = prefs.getString('fullName') ?? 'غير معروف';
//       phone = prefs.getString('phoneNumber') ?? 'غير معروف';
//       email = prefs.getString('email') ?? 'غير معروف';
//       birthDate = prefs.getString('birthday') ?? 'غير معروف';
//       imageUrl = prefs.getString('imageUrl');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               buildHeader(context: context, imageUrl: imageUrl),
//               customcart(
//                 fullName: fullName,
//                 phone: phone,
//                 email: email,
//                 birthDate: birthDate,
//               ),
//               SizedBox(height: 25.h),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:consult_me/core/constants/app_colors.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/profile_view.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/presentation/logic/update_profile_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/presentation/logic/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';


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
  String? imageUrl,hintName,hintPhone,hintBirthdate;
  

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
    if (_formKey.currentState!.validate() ) {
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
      appBar: AppBar(title: const Text('تعديل البروفايل',
      
      
      ),      backgroundColor: AppColors.wightcolor,
),
      body: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is GetProfileSuccess) {
            SharedPreferences.getInstance().then((prefs) {
              prefs.setString("fullName", state.model.fullName);
              prefs.setString("phoneNumber", state.model.phoneNumber);
              prefs.setString("birthday",state.model.birthday);

              if (selectedImage != null) {
                prefs.setString("imageUrl", state.model.imageUrl);
              }
            });
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfileScreen(),));
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("تم تعديل البروفايل بنجاح")),
            );
           // Navigator.pop(context); // ترجع للصفحة السابقة
          } else if (state is ProfileFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("فشل التحديث: ${state.errorMessage}")),
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:   selectedImage != null
                        ? FileImage(File(selectedImage!.path!))
                        : 
                               NetworkImage(imageUrl??""),
                  ),
                ),
                const SizedBox(height: 20),
                Text( "الاسم الكامل"),
                TextFormField(
                  controller: nameController,
                  
                  decoration:  InputDecoration(hintText:hintName ??""),
                  validator: (value) =>
                      value!.isEmpty ? "الاسم مطلوب" : null,
                ),
                const SizedBox(height: 12),
                Text( "رقم الهاتف"),
                TextFormField(
                  controller: phoneController,
                  decoration:  InputDecoration(hintText: hintPhone ??""),
                  validator: (value) =>
                      value!.isEmpty ? "رقم الهاتف مطلوب" : null,
                ),
                const SizedBox(height: 12),
              Text( "تاريخ الميلاد",),
                TextFormField(
                  controller: birthdateController,
                  decoration:
                       InputDecoration(hintText: hintBirthdate ??""),
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
                  validator: (value) =>
                      value!.isEmpty ? "تاريخ الميلاد مطلوب" : null,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _submit,
                  child: const Text("تحديث البيانات",style: TextStyle(color: AppColors.wightcolor),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
