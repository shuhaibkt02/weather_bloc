import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String timeZone;
  final int celsius;
  final String weatherCondition;
  final int condition;

  const WeatherCard({
    super.key,
    required this.timeZone,
    required this.celsius,
    required this.weatherCondition,
    required this.condition,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Text(
            timeZone.toUpperCase(),
            textAlign: TextAlign.left,
          ),
        ),
        Flexible(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: Colors.orange.shade700,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 50,
                    margin: const EdgeInsets.all(5),
                    child: const Icon(
                      Icons.cloudy_snowing,
                      size: 28,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5),
                    child: Text(
                      "$celsius°",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.all(5),
                      child: Text(
                        weatherCondition,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black54,
                          letterSpacing: -0.9,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.energy_savings_leaf_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                        Text(
                          " $condition %",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TomorrowTag extends StatelessWidget {
  const TomorrowTag({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final day = DateTime.now().toUtc();
    print("$day");
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Tomorrow'.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.orange.shade800,
          ),
        ],
      ),
    );
  }
}
