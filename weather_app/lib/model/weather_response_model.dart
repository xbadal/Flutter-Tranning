class WeatherResponseModel {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  double? elevation;
  CurrentUnits? currentUnits;
  Current? current;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  WeatherResponseModel(
      {this.latitude,
        this.longitude,
        this.generationtimeMs,
        this.utcOffsetSeconds,
        this.timezone,
        this.timezoneAbbreviation,
        this.elevation,
        this.currentUnits,
        this.current,
        this.hourlyUnits,
        this.hourly});

  WeatherResponseModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    currentUnits = json['current_units'] != null
        ? new CurrentUnits.fromJson(json['current_units'])
        : null;
    current =
    json['current'] != null ? new Current.fromJson(json['current']) : null;
    hourlyUnits = json['hourly_units'] != null
        ? new HourlyUnits.fromJson(json['hourly_units'])
        : null;
    hourly =
    json['hourly'] != null ? new Hourly.fromJson(json['hourly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['generationtime_ms'] = this.generationtimeMs;
    data['utc_offset_seconds'] = this.utcOffsetSeconds;
    data['timezone'] = this.timezone;
    data['timezone_abbreviation'] = this.timezoneAbbreviation;
    data['elevation'] = this.elevation;
    if (this.currentUnits != null) {
      data['current_units'] = this.currentUnits!.toJson();
    }
    if (this.current != null) {
      data['current'] = this.current!.toJson();
    }
    if (this.hourlyUnits != null) {
      data['hourly_units'] = this.hourlyUnits!.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly!.toJson();
    }
    return data;
  }
}

class CurrentUnits {
  String? time;
  String? interval;
  String? temperature2m;
  String? windSpeed10m;

  CurrentUnits(
      {this.time, this.interval, this.temperature2m, this.windSpeed10m});

  CurrentUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    windSpeed10m = json['wind_speed_10m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['interval'] = this.interval;
    data['temperature_2m'] = this.temperature2m;
    data['wind_speed_10m'] = this.windSpeed10m;
    return data;
  }
}

class Current {
  String? time;
  int? interval;
  double? temperature2m;
  double? windSpeed10m;

  Current({this.time, this.interval, this.temperature2m, this.windSpeed10m});

  Current.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    windSpeed10m = json['wind_speed_10m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['interval'] = this.interval;
    data['temperature_2m'] = this.temperature2m;
    data['wind_speed_10m'] = this.windSpeed10m;
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;
  String? relativeHumidity2m;
  String? windSpeed10m;

  HourlyUnits(
      {this.time,
        this.temperature2m,
        this.relativeHumidity2m,
        this.windSpeed10m});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
    relativeHumidity2m = json['relative_humidity_2m'];
    windSpeed10m = json['wind_speed_10m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    data['relative_humidity_2m'] = this.relativeHumidity2m;
    data['wind_speed_10m'] = this.windSpeed10m;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2m;
  List<int>? relativeHumidity2m;
  List<double>? windSpeed10m;

  Hourly(
      {this.time,
        this.temperature2m,
        this.relativeHumidity2m,
        this.windSpeed10m});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].cast<double>();
    relativeHumidity2m = json['relative_humidity_2m'].cast<int>();
    windSpeed10m = json['wind_speed_10m'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    data['relative_humidity_2m'] = this.relativeHumidity2m;
    data['wind_speed_10m'] = this.windSpeed10m;
    return data;
  }
}