import 'package:flutter/material.dart';
import 'package:weather_bloc/presentation/widgets/weather_card.dart';

class SecondCard extends StatelessWidget {
  const SecondCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 12, 17, 82),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: const Column(
          children: [
            TomorrowTag(),
            Flexible(
              child: WeatherCard(
                timeZone: "Morning",
                celsius: 23,
                weatherCondition: "Thunderstorm",
                condition: 77,
              ),
            ),
            Flexible(
              child: WeatherCard(
                timeZone: "Afternoon",
                celsius: 27,
                weatherCondition: "Light Rain",
                condition: 65,
              ),
            ),
            Flexible(
              child: WeatherCard(
                timeZone: "Evening",
                celsius: 22,
                weatherCondition: "Heavy Rain",
                condition: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
