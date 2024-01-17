import 'package:flutter/material.dart';

class SmallWeatherCard extends StatelessWidget {
  const SmallWeatherCard({
    super.key,
    required this.timeZone,
    required this.celsius,
  });

  final String timeZone;
  final int celsius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          timeZone.toUpperCase(),
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.dark_mode,
              size: 45,
            ),
            // const SizedBox(width: 8),
            Text(
              '$celsius°',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 32,
              ),
            ),
          ],
        )
      ],
    );
  }
}
