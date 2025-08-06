import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

Future<List<File>> pickFiles() async {
  final result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.any,
  );

  if (result != null && result.files.isNotEmpty) {
    return result.files
        .where((file) => file.path != null)
        .map((file) => File(file.path!))
        .toList();
  }

  return [];
}


Future<File?> pickImage() async {
  try {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      // User canceled the image selection
      print('Image selection canceled by user');
      return null;
    }
  } catch (e) {
    // Handle specific errors and log them
    if (e is PlatformException) {
      if (e.code == 'photo_access_denied') {
        print('Photo gallery access denied');
      } else if (e.code == 'camera_access_denied') {
        print('Camera access denied');
      } else {
        print('Platform error: $e');
      }
    } else {
      print('Failed to pick image: $e');
    }
    return null;
  }
}
