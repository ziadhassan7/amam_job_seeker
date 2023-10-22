class GeoModel {
  double? latitude;
  double? longitude;

  GeoModel({this.latitude, this.longitude});

  GeoModel.fromJson(Map<String, dynamic> json) {
    latitude = json['lat'];
    longitude = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = latitude;
    data['lon'] = longitude;
    return data;
  }
}