import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/model/weather.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class HourlyWeatherWidget extends StatefulWidget {
  const HourlyWeatherWidget({Key? key, required this.hourlyWeather})
      : super(key: key);
  final List<Weather> hourlyWeather;

  @override
  State<HourlyWeatherWidget> createState() => _HourlyWeatherWidgetState();
}

class _HourlyWeatherWidgetState extends State<HourlyWeatherWidget> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: widget.hourlyWeather.length,
      itemBuilder: (context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = index;
            });
          },
          child: Container(
            decoration: BoxDecoration(
                color: selectedIndex == index ? AppColors.accentLight : null,
                borderRadius: BorderRadius.circular(12)),
            margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Column(
              children: [
                Text(
                  '+${widget.hourlyWeather[index].degree} °C',
                  style: AppStyles.s16w600.copyWith(color: Colors.black),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset(
                    widget.hourlyWeather[index].status,
                    width: 60,
                  ),
                ),
                Text(
                  DateFormat.Hm().format(
                      DateTime.tryParse(widget.hourlyWeather[index].hour)!),
                  style: AppStyles.s16w400.copyWith(color: Colors.black),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
