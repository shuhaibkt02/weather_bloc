import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/logic/bloc/weather_bloc.dart';
import 'package:weather_bloc/presentation/widgets/second_card.dart';
import 'package:weather_bloc/presentation/widgets/small_weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade800,
      body: SafeArea(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is WeatherInitial) {
              context
                  .read<WeatherBloc>()
                  .add(WeatherFetch(cityName: 'kozhikode'));
            }
            if (state is WeatherFailure) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            if (state is! WeatherSuccess) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrangeAccent.shade700,
                ),
              );
            }

            final data = state.weatherModel;
            return Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.orange.shade800,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Weather Forecast',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          // height: 250,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.cloud,
                                    size: 125,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${data.celsius}°',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(Icons.location_on),
                                        const SizedBox(width: 5),
                                        Text(
                                          "${data.cityName}, Kerala",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 0.3,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      data.weatherStatus,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        letterSpacing: -0.5,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Wind : ${data.wind}mph",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          "Humidity ${data.humidity}%",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: double.infinity,
                          child: Row(
                            children: [
                              Flexible(
                                child: SmallWeatherCard(
                                  timeZone: 'Afternoon',
                                  celsius: 25,
                                ),
                              ),
                              Flexible(
                                child: SmallWeatherCard(
                                  timeZone: 'Evening',
                                  celsius: 23,
                                ),
                              ),
                              Flexible(
                                child: SmallWeatherCard(
                                  timeZone: 'Night',
                                  celsius: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SecondCard(),
              ],
            );
          },
        ),
      ),
    );
  }
}
