import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              "Weather App",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: controller.isLoading
              ? const Center(child: CircularProgressIndicator())
              : controller.weatherData != null
                  ? Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                  "Latitude : ${controller.weatherData!.latitude}"),
                              const SizedBox(
                                width: 24,
                              ),
                              Text(
                                  "Longitude : ${controller.weatherData!.longitude}")
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "Timezone : ${controller.weatherData!.timezone}"),
                              const SizedBox(
                                width: 24,
                              ),
                              Text(
                                  "Elevation : ${controller.weatherData!.elevation}")
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "Temperature ${controller.weatherData?.current?.temperature2m} ${controller.weatherData?.currentUnits?.temperature2m}"),
                              const SizedBox(
                                width: 24,
                              ),
                              Text(
                                  "Wind Speed ${controller.weatherData?.current?.windSpeed10m} ${controller.weatherData?.currentUnits?.windSpeed10m}"),
                            ],
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: Text("No Data"),
                    ),
        );
      },
      init: HomeController(),
    );
  }
}
