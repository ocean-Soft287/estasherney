import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/presentation/logic/update_profile_cubit.dart';
import 'package:consult_me/feature/home/presentation/views/screens/profile/screens/setting/presentation/logic/update_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController birthdateController;

  PlatformFile? selectedImage;

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
    nameController.text = prefs.getString("fullName") ?? "";
    phoneController.text = prefs.getString("phoneNumber") ?? "";
    birthdateController.text = prefs.getString("birthday") ?? "";
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
      appBar: AppBar(title: const Text('تعديل البروفايل')),
      body: BlocListener<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          if (state is UpdateProfileSuccess) {
            SharedPreferences.getInstance().then((prefs) {
              prefs.setString("fullName", nameController.text.trim());
              prefs.setString("phoneNumber", phoneController.text.trim());
              prefs.setString("birthday", birthdateController.text.trim());

              if (selectedImage != null) {
                prefs.setString("imageUrl", selectedImage!.path!);
              }
            });

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("تم تعديل البروفايل بنجاح")),
            );
            Navigator.pop(context); // ترجع للصفحة السابقة
          } else if (state is UpdateProfileFailure) {
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
                    backgroundImage: selectedImage != null
                        ? FileImage(File(selectedImage!.path!))
                        : const AssetImage("assets/images/default_profile.png")
                            as ImageProvider,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: "الاسم الكامل"),
                  validator: (value) =>
                      value!.isEmpty ? "الاسم مطلوب" : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: "رقم الهاتف"),
                  validator: (value) =>
                      value!.isEmpty ? "رقم الهاتف مطلوب" : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: birthdateController,
                  decoration:
                      const InputDecoration(labelText: "تاريخ الميلاد"),
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
                  onPressed: _submit,
                  child: const Text("تحديث البيانات"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
