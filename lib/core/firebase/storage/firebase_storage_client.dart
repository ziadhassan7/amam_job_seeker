import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageClient {

  static final storageRef  = FirebaseStorage.instance.ref();

  //// ---- Always remember to do this
  //// ----------> https://stackoverflow.com/a/64771877/9242141


  /// Upload File
  Future<TaskSnapshot?> uploadFile(Uint8List file, {required String filePath}) async {

    // Creates a reference to file
    final imageRef = storageRef.child(filePath);

    try {
      return await imageRef.putData(file); //uploads (Note: We can use putFile - I used putData, cuz I had to return Unit8List from FilePicker to work with web)

    } on FirebaseException catch (e) {
      print("FirebaseException: $e");
      return null;
    }
  }


  /// Delete File
  deleteFile({required String filePath}) async {

    // Delete file
    storageRef.child(filePath).delete();
  }


  /// Delete Folder
  deleteFolder({required String folderPath}) async {

    // Get reference to folder
    final folderRef  = storageRef.child(folderPath);

    //folders are just paths, so you need to delete each file in that path
    final listResult = await folderRef.listAll();

    for (var item in listResult.items) {
      item.delete();
    }
  }
}