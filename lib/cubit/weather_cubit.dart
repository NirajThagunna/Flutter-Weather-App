import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_and_cubit_design_pattern/data/model/weather.dart';
import 'package:flutter_bloc_and_cubit_design_pattern/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherCubit(this._weatherRepository) : super(const WeatherInitial());

  Future<void> getWeather(String cityName) async {
    try {
      emit(const WeatherLoading());
      final weather = await _weatherRepository.fetchWeather(cityName);
      emit(WeatherLoaded(weather));
    } on NetworkException {
      emit(const WeatherError('Hey, check you internet connection!'));
    }
  }
}
