import 'dart:typed_data';
import 'package:amam_job_seeker_assessment/core/utils/file_helper.dart';
import 'package:amam_job_seeker_assessment/futures/profile/data/repository/profile_repo.dart';
import 'package:amam_job_seeker_assessment/futures/resume/data/repository/resume_firebase_crud.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/manager/controller/upload_status_controller.dart';
import 'package:amam_job_seeker_assessment/futures/resume/presentation/manager/state_manager/upload_failed_provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../core/firebase/firebase_auth/auth.dart';
import '../../../data/repository/resume_repo.dart';

class ResumeController {

  ResumeController(this.ref);
  final WidgetRef ref;

  Future pickFileAndUploadCv() async {

    // Pick File
    PlatformFile? pickedFile = await FileHelper.pickFiles();

    if (pickedFile != null) {
      Uint8List? pickedFileByte = pickedFile.bytes; //we use bytes to work in web

      if(pickedFileByte != null) {

        //If user is logged in
        if(Auth().currentUser != null){
          try{
            _storeUserDataFromResume(pickedFileByte);

          }catch (e){
            handleException();
          }
        }
      }
    }

  }


  void _storeUserDataFromResume(Uint8List file) async {
    // Upload File
    String? resumeLink = await _uploadResume(file);

    if(resumeLink != null) {

      //get data from cv
      Map? data = await _parseUserProfileFromResume(resumeLink);

      //store user data in firebase
      data != null
          ? _storeUserProfile(data)
          : handleException();

    } else {
      handleException();
    }
  }


  //upload resume to Firebase Storage
  //get file url
  Future<String?> _uploadResume(Uint8List file) async {
    //start loading widget
    UploadStatusController.triggerLoading(ref);
    //upload...
    Reference? resume = await ResumeFirebaseCrud.uploadResume(file, userId: Auth().currentUser!.uid,);

    if(resume != null){
      //get url
      return await resume.getDownloadURL();
    }

    return null;
  }


  //parse cv with superparser api
   Future<Map?> _parseUserProfileFromResume(String resumeUrl) async{

     return await ResumeRepo.parseUrlResume(resumeUrl: "$resumeUrl.");
  }


  //store data in realtime_database
  _storeUserProfile(Map data) async {
    //add user profile
    ProfileRepo.addProfile(data, Auth().currentUser!.uid);
    //close loading widget
    UploadStatusController.finishLoading(ref);
  }


  handleException(){
    //Exception dialog
   ref.read(uploadFailedProvider.notifier).show();
  }
}