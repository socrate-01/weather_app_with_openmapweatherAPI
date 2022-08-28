import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_weather_example_flutter/src/entities/weather/weather_data.dart';
import 'package:open_weather_example_flutter/src/features/weather_page/city_search_box_all.dart';
import 'package:open_weather_example_flutter/src/repositories/api_error.dart';
import 'package:open_weather_example_flutter/src/repositories/weather_repository.dart';

class CurrentWeatherControllerAll extends StateNotifier<AsyncValue<WeatherData>> {
  CurrentWeatherControllerAll(this._weatherRepository, {required this.city})
      : super(const AsyncValue.loading()) {
    getWeather(city: city);
  }
  final HttpWeatherRepository _weatherRepository;
  final String city;

  Future<void> getWeather({required String city}) async {
    try {
      state = const AsyncValue.loading();
      final weather = await _weatherRepository.getWeather(city: city);
      state = AsyncValue.data(WeatherData.from(weather));
    } on APIError catch (e) {
      state = e.asAsyncValue();
    }
  }
}

final currentWeatherControllerProviderAll = StateNotifierProvider.autoDispose<
    CurrentWeatherControllerAll, AsyncValue<WeatherData>>((ref) {
  final weatherRepository = ref.watch(weatherRepositoryProvider);
  final city = ref.watch(cityProvider4);
  return CurrentWeatherControllerAll(weatherRepository, city: city);
});
