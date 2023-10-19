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
  static add(Map data, {String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    ref.set(data);
  }

  //update
  static update(Map<String, dynamic> data, {String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    ref.update(data);
  }

  //get
  static Object? getRealTime({String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    Object? data;

    //Listen to value , you can return (ref.onValue) as Stream
    ref.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
    });

    return data;
  }

  static Object? getOnce({String? dataPath}) async {
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