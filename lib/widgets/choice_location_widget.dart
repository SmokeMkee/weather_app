import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import '../ui/search_location_screen.dart';

class ChoiceLocationWidget extends StatelessWidget {
  const ChoiceLocationWidget({Key? key}) : super(key: key);

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
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchLocationScreen(),
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
