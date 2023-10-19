import 'dart:io';
import 'package:amam_job_seeker_assessment/core/utils/file_helper.dart';
import 'package:file_picker/file_picker.dart';

class ResumeController {


  static pickFileAndUploadCv() async {

    // Pick File
    PlatformFile? pickedFile = await FileHelper.pickFiles();

    if (pickedFile != null) {
      String? pickedFilePath = pickedFile.path;

      if(pickedFilePath != null) {
        File file = File(pickedFile.path!);

        //

      }
    }
  }

}