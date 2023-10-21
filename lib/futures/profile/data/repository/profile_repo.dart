import '../../../../core/firebase/real_time/database_client.dart';

class ProfileRepo {

  static addProfile(Map data, String userId){
    DatabaseClient.add(data, dataPath: userId);
  }

}