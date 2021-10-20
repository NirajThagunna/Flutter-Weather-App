import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_and_cubit_design_pattern/data/model/weather.dart';
import 'package:flutter_bloc_and_cubit_design_pattern/data/weather_repository.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository _weatherRepository;

  WeatherBloc(this._weatherRepository) : super(const WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is GetWeather) {
      try {
        yield const WeatherLoading();
        final weather = await _weatherRepository.fetchWeather(event.cityName);
        yield WeatherLoaded(weather);
      } on NetworkException {
        yield const WeatherError('Hey, check you internet connection!');
      }
    }
  }
}
