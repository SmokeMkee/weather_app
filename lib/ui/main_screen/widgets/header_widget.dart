import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/model/location.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_styles.dart';
import '../../search_screen/search_location_screen.dart';
import '../../../widgets/add_remove_favorite_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key, required this.location}) : super(key: key);
  final Location? location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Row(
        children: [
          GestureDetector(
            child: SvgPicture.asset(
              AppAssets.svg.location,
              color: Colors.white,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchLocationScreen(),
                ),
              );
            },
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              location?.cityName ?? 'Город не определен',
              style: AppStyles.s16w600,
            ),
          ),
          location == null
              ? const SizedBox.shrink()
              : AddRemoveFavoriteWidget(
                  isNotFavoriteColor: Colors.white,
                  isFavoriteColor: Colors.white,
                  location: location!,
                )
        ],
      ),
    );
  }
}
