import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather.dart';

import '../constants/app_styles.dart';

class HourlyWeatherWidget extends StatelessWidget {
  const HourlyWeatherWidget({Key? key, required this.hourlyWeather})
      : super(key: key);
  final Weather hourlyWeather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Text(
            '+${hourlyWeather.degree} °C',
            style: AppStyles.s16w600.copyWith(color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Image.asset(
              hourlyWeather.status,
              width: 60,
            ),
          ),
          Text(
            DateFormat.Hm().format(DateTime.tryParse(hourlyWeather.hour)!),
            style: AppStyles.s16w400.copyWith(color: Colors.black),
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
