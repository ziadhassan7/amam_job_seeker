import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreClient {

  final fireStore = FirebaseFirestore.instance;

  // Add
  addDoc(
      {required String collectionName,
      required String docId,
      required Map<String, dynamic> data}) async {

    await fireStore.collection(collectionName).doc(docId).set(data);
  }

  // Update
  updateDoc(
      {required String collectionName,
      required String docId,
      required Map<String, dynamic> data}) async {

    await fireStore.collection(collectionName).doc(docId).update(data);
  }

  // Delete
  deleteDoc({required String collectionName, required String docId,}) async {

    await fireStore.collection(collectionName).doc(docId).delete();
  }
}
