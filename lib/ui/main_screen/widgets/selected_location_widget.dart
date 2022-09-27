import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_styles.dart';
import 'package:weather_app/model/location.dart';

import '../../../constants/app_assets.dart';
import '../../../widgets/choice_location_button_widget.dart';
import 'bottom_weather_info_widget.dart';
import 'header_widget.dart';

class SelectedLocationWidget extends StatelessWidget {
  const SelectedLocationWidget({Key? key, required this.location})
      : super(key: key);
  final Locate? location;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HeaderWidget(
          location: location,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.images.cloudy,
                  width: 200,
                ),
                Text(
                  location?.degree.toString() ?? '-',
                  style: AppStyles.s48w600,
                ),
                Text(
                  location?.status.toString() ?? '-',
                  style: AppStyles.s20w600,
                )
              ],
            ),
          ),
        ),
        location == null
            ? const ChoiceLocationButtonWidget()
            : BottomWeatherInfoWidget(
                location: location!,
              )
      ],
    );
  }
}
