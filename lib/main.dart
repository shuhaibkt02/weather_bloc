import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_bloc/data/provider/weather_data_provider.dart';
import 'package:weather_bloc/data/repository/weather_repositery.dart';
import 'package:weather_bloc/logic/bloc/weather_bloc.dart';
import 'package:weather_bloc/presentation/screen/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) =>
          WeatherRepositery(weatherDataProvider: WeatherDataProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(context.read<WeatherRepositery>()),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          home: const HomeScreen(),
        ),
      ),
    );
  }
}
