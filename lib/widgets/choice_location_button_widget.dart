import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/search_location/bloc_location.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import '../ui/search_screen/search_location_screen.dart';

class ChoiceLocationButtonWidget extends StatelessWidget {
  const ChoiceLocationButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () {
          BlocProvider.of<BlocLocation>(context)
              .add(EventShowFavoriteLocation());
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SearchLocationScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Text(
            'Выбрать локацию',
            style: AppStyles.s16w600.copyWith(
              color: AppColors.accentDark,
            ),
          ),
        ),
      ),
    );
  }
}
