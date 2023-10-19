import 'dart:io';
import 'package:amam_job_seeker_assessment/core/utils/file_helper.dart';
import 'package:amam_job_seeker_assessment/futures/resume/data/repository/resume_crud.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../core/firebase/firebase_auth/auth.dart';

class ResumeController {


  static Future<Reference?> pickFileAndUploadCv() async {

    // Pick File
    PlatformFile? pickedFile = await FileHelper.pickFiles();

    if (pickedFile != null) {
      String? pickedFilePath = pickedFile.path;

      if(pickedFilePath != null) {
        File file = File(pickedFile.path!);

        // Upload File
        if(Auth().currentUser != null){
          //get reference
          return await ResumeCrud.uploadResume(file, userId: Auth().currentUser!.uid,);
        }
      }
    }

    return null;
  }

}