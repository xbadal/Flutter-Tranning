import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/weather_response_model.dart';

class HomeController extends GetxController {
  WeatherResponseModel? weatherData;

  bool isLoading = false;

  @override
  void onInit() {
    super.onInit();
    fetchWeatherDetails();
  }

  Future<void> fetchWeatherDetails() async {
    isLoading = true;
    update();

    var client = http.Client();

    try {
      Map<String, dynamic> query = {
        "latitude": '52.52',
        "longitude": '13.41',
        "current": "temperature_2m,wind_speed_10m",
        "hourly": "temperature_2m,relative_humidity_2m,wind_speed_10m",
      };

      // Base Url + rest url + query Params  = Url
      var url = Uri.https("api.open-meteo.com", '/v1/forecast', query);
      // GET

      // POST

      // PUT

      // DELETE


      var response = await client.get(url);

      Map<String, dynamic> decodedResponse =
          jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      weatherData = WeatherResponseModel.fromJson(decodedResponse);



    } catch (e) {
      print(e.toString());
    } finally {
      isLoading = false;
      client.close();
      update();
    }
  }
}
