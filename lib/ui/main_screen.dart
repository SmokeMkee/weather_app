import 'package:flutter/material.dart';
import 'package:weather_app/constants/app_assets.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/app_styles.dart';
import 'package:weather_app/model/location.dart';
import 'package:weather_app/widgets/choice_location_button_widget.dart';
import 'package:weather_app/widgets/main_menu_info_widget.dart';
import '../widgets/header_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, this.location}) : super(key: key);
  final Location? location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentDark,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.images.bgDelimiter),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              HeaderWidget(
                location: location,
              ),
              Padding(
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
              const Spacer(),
              location == null
                  ? const ChoiceLocationButtonWidget()
                  : MainMenuInfoWidget(location: location!)
            ],
          ),
        ),
      ),
    );
  }
}
