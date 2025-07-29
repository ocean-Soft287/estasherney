import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickFile() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.any,
  );

  if (result != null && result.files.isNotEmpty) {
    return File(result.files.single.path!);
  }

  return null;
}

Future<File?> pickImage() async {
  final picker = ImagePicker();
  final pickedImage = await picker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
    return File(pickedImage.path);
  }

  return null;
}
