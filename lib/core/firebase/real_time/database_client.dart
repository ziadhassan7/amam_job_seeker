import 'dart:async';

import 'package:firebase_database/firebase_database.dart';


class DatabaseClient {

  static final FirebaseDatabase _database = FirebaseDatabase.instance;

  /*
  Remember to set your host location, before configuring Firebase
  If you set it to another location different than US, you need to configure it again!
  (or you will face some problems as firebase will not identify the database url)
  (and will ask you to change it)
   */


  //add
  static add(Object data, {String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    ref.set(data);
  }

  //update
  static update(Map<String, Object> data, {String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    ref.update(data);
  }

  //get
  static Stream<DatabaseEvent> getRealTime({String? dataPath}) {
    DatabaseReference ref = _database.ref(dataPath);

    return ref.onValue; //get stream
  }

  static Future<Object?> getOnce({String? dataPath}) async {
    DatabaseReference ref = _database.ref(dataPath);

    final event = await ref.once(DatabaseEventType.value);
    return event.snapshot.value;
  }

  //delete
  static delete({String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    ref.remove();
  }

}