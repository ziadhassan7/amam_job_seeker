import 'package:amam_job_seeker_assessment/core/firebase/constants/firebase_const.dart';
import 'package:amam_job_seeker_assessment/core/firebase/real_time/firestore_client.dart';
import '../model/user_model.dart';

class UserCrud {

  final _firestoreClient = FirestoreClient();

  ///----------------------- Add Resume
  addProfile({required String userId, required UserModel data}) async{

    await _firestoreClient.addDoc(
      collectionName: firebase_collection_profile,
      docId: userId,
      data: data.toMap());

  }

  ///----------------------- Change Resume
  updateProfile({required String userId, required UserModel data}) async{

    await _firestoreClient.updateDoc(
        collectionName: firebase_collection_profile,
        docId: userId,
        data: data.toMap());

  }
}

