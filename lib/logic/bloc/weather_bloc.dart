import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_bloc/data/model/weather_model.dart';
import 'package:weather_bloc/data/repository/weather_repositery.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositery weatherRepositery;
  WeatherBloc(this.weatherRepositery) : super(WeatherInitial()) {
    on<WeatherFetch>(_weatherFetch);
  }

  void _weatherFetch(WeatherFetch event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final cityName = event.cityName;
      final weather = await weatherRepositery.getCurrentWeather(cityName);
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(errorMessage: '$e'));
    }
  }
}
