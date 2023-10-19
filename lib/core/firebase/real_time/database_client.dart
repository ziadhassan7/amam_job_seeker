import 'package:firebase_database/firebase_database.dart';

class DatabaseClient {

  static final FirebaseDatabase _database = FirebaseDatabase.instance;


  //add
  add(Map data, {String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    ref.set(data);
  }

  //update
  update(Map<String, dynamic> data, {String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    ref.update(data);
  }

  //get
  Object? getRealTime({String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    Object? data;

    //Listen to value , you can return (ref.onValue) as Stream
    ref.onValue.listen((DatabaseEvent event) {
      data = event.snapshot.value;
    });

    return data;
  }

  Object? getOnce({String? dataPath}) async {
    DatabaseReference ref = _database.ref(dataPath);

    final event = await ref.once(DatabaseEventType.value);
    return event.snapshot.value;
  }

  //delete
  delete({String? dataPath}){
    DatabaseReference ref = _database.ref(dataPath);

    ref.remove();
  }

}