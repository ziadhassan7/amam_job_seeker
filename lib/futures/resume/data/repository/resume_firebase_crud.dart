import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../core/firebase/constants/firebase_const.dart';
import '../../../../core/firebase/storage/firebase_storage_client.dart';

class ResumeFirebaseCrud {

  static final _firebaseStorageClient = FirebaseStorageClient();

  ///----------------------- Add Resume
  static Future<Reference?> uploadResume(File file, {required String userId,}) async{

    const profileCollection = firebase_collection_profile;

    final UploadTask? uploadTask = _firebaseStorageClient.uploadFile(
        file, filePath: "$profileCollection/$userId/cv");


    if(uploadTask != null) {
      return uploadTask.snapshot.ref;
    }

    return null;
  }


}