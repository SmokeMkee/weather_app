import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:wheather_app/constants/app_styles.dart';
import 'package:wheather_app/model/location.dart';

import '../constants/app_assets.dart';
import 'hourly_weather.dart';

external int get hour;

class MainMenuInfoWidget extends StatelessWidget {
  const MainMenuInfoWidget({Key? key, required this.location})
      : super(key: key);
  final Location location;

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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat.yMMMd()
                          .format(DateTime.tryParse(location.timeToday!)!),
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
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: location.weather!.length,
                  itemBuilder: (context, int index) {
                    return HourlyWeatherWidget(
                        hourlyWeather: location.weather![index]);
                  },
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
