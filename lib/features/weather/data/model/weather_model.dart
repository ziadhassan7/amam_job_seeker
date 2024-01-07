class WeatherModel {
  List<Weather>? weather;
  Main? main;
  String? name;

  WeatherModel(
      {this.weather,
        this.main,
        this.name});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather!.add(Weather.fromJson(v));
      });
    }
    main = json['main'] != null ? Main.fromJson(json['main']) : null;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    if (weather != null) {
      data['weather'] = weather!.map((v) => v.toJson()).toList();
    }
    if (main != null) {
      data['main'] = main!.toJson();
    }
    data['name'] = name;

    return data;
  }
}

class Weather {
  String? main;
  String? description;
  String? icon;

  Weather({this.main, this.description, this.icon});

  Weather.fromJson(Map<String, dynamic> json) {
    main = json['main'];
    description = json['description'];
    icon = json['icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['main'] = main;
    data['description'] = description;
    data['icon'] = icon;
    return data;
  }
}

class Main {
  double? temp;
  num? feelsLike;
  num? tempMin;
  num? tempMax;

  Main(
      {this.temp,
        this.feelsLike,
        this.tempMin,
        this.tempMax,});

  Main.fromJson(Map<String, dynamic> json) {
    temp = json['temp'];
    feelsLike = json['feels_like'];
    tempMin = json['temp_min'];
    tempMax = json['temp_max'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    return data;
  }
}