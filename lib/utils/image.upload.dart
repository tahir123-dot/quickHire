import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  static final ImagePicker _picker = ImagePicker();

  // reusable image picker function

  static Future<File?> pickImage({
    required ImageSource source,
    int imageQuality = 80,
    double? maxWidth,
    double? maxHeight,
  }) async {
    try {
      final XFile? pickedImage = await _picker.pickImage(
        source: source,
        imageQuality: imageQuality,
        maxWidth: maxWidth,
        maxHeight: maxHeight,
      );
      if (pickedImage == null) {
        return null;
      }

      return File(pickedImage.path);
    } catch (e) {
      print("Image picker error: $e");
      return null;
    }
  }
}
