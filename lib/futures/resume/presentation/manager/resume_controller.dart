import 'dart:io';
import 'package:amam_job_seeker_assessment/core/firebase/real_time/database_client.dart';
import 'package:amam_job_seeker_assessment/core/utils/file_helper.dart';
import 'package:amam_job_seeker_assessment/futures/resume/data/repository/resume_firebase_crud.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../core/firebase/firebase_auth/auth.dart';
import '../../data/repository/resume_repo.dart';

class ResumeController {


  static Future pickFileAndUploadCv() async {

    // Pick File
    PlatformFile? pickedFile = await FileHelper.pickFiles();

    if (pickedFile != null) {
      String? pickedFilePath = pickedFile.path;

      if(pickedFilePath != null) {
        File file = File(pickedFile.path!);

        //If user is logged in
        if(Auth().currentUser != null){

          _storeUserDataFromResume(file);
        }
      }
    }

  }


  static void _storeUserDataFromResume(File file) async {
    // Upload File
    String? resumeLink = await _uploadResume(file);

    if(resumeLink != null) {

      // delay for cv link to appear in Firebase Storage
      Future.delayed(const Duration(milliseconds: 500), () async {
        //get data from cv
        Map? data = await _parseUserProfileFromResume(resumeLink);

        //store user data in firebase
        data != null
          ? _storeUserProfile(data)
          : _handeException();

      });

    } else {
      _handeException();
    }
  }


  //upload resume to Firebase Storage
  //get file url
  static Future<String?> _uploadResume(File file) async {
    Reference? resume = await ResumeFirebaseCrud.uploadResume(file, userId: Auth().currentUser!.uid,);

    if(resume != null){
      return await resume.getDownloadURL();
    }

    return null;
  }


  //parse cv with superparser api
   static Future<Map?> _parseUserProfileFromResume(String resumeUrl) async{

     return await ResumeRepo.parseUrlResume(resumeUrl: "$resumeUrl.");
  }


  //store data in realtime_database
  static _storeUserProfile(Map data) async {
    DatabaseClient.add(data);
  }


  static _handeException(){
    //Exception dialog
    //... todo
  }
}