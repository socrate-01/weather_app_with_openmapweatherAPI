import 'package:flutter/material.dart';
import 'package:open_weather_example_flutter/src/constants/app_colors.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/city_search_box_all.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/current_weather_all.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/hourly_weather_all.dart';

class WeatherPageAll extends StatelessWidget {
  const WeatherPageAll({Key? key, required this.city}) : super(key: key);
  final String city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.rainGradient,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Spacer(),
              CitySearchBoxAll(),
              Spacer(),
              CurrentWeatherAll(),
              Spacer(),
              HourlyWeatherAll(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
