import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ImageService {
  static final ImagePicker _picker = ImagePicker();

  // اختيار صورة من المعرض
  static Future<File?> pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );
    
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  // التقاط صورة بالكاميرا
  static Future<File?> pickImageFromCamera() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 85,
    );
    
    if (image != null) {
      return File(image.path);
    }
    return null;
  }

  // حفظ الصورة محلياً
  static Future<File> saveImageLocally(File imageFile) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = 'profile_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final newPath = path.join(directory.path, fileName);
    
    return await imageFile.copy(newPath);
  }

  // جلب الصورة المحفوظة
  static Future<File?> getSavedImage() async {
    final directory = await getApplicationDocumentsDirectory();
    final files = directory.listSync();
    
    for (var file in files) {
      if (file.path.contains('profile_')) {
        return File(file.path);
      }
    }
    return null;
  }
}