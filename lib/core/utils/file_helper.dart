import 'package:file_picker/file_picker.dart';

class FileHelper {


  /// Pick file
  static Future<PlatformFile?> pickFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
      allowMultiple: false,
    );

    PlatformFile? filePath = result?.files.first;
    return filePath;
  }

}