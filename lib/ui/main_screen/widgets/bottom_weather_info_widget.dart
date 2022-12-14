import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/location.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_styles.dart';
import 'hourly_weather.dart';

class BottomWeatherInfoWidget extends StatelessWidget {
  const BottomWeatherInfoWidget({Key? key, required this.location})
      : super(key: key);
  final Locate location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Row(
            children: [
              SvgPicture.asset(AppAssets.svg.windy),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text('${location.velocity} км/ч',
                    style: AppStyles.s16w400.copyWith(color: Colors.white)),
              ),
              SvgPicture.asset(AppAssets.svg.hun),
              const SizedBox(
                width: 10,
              ),
              Text('${location.humidity} %',
                  style: AppStyles.s16w400.copyWith(color: Colors.white))
            ],
          ),
        ),
        Container(
          height: 220,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMd()
                          .format(DateTime.tryParse(location.timeToday)!),
                      style: AppStyles.s16w600.copyWith(color: Colors.black),
                    ),
                    Text(
                      '+7 / -2° С',
                      style: AppStyles.s16w400.copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: HourlyWeatherWidget(
                hourlyWeather: location.weather,
              ))
            ],
          ),
        ),
      ],
    );
  }
}
