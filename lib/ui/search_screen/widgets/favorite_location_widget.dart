import 'package:flutter/material.dart';
import 'package:weather_app/widgets/location_card_widget.dart';
import 'package:weather_app/widgets/not_found_widget.dart';

import '../../../model/location.dart';

class FavoriteLocationWidget extends StatelessWidget {
  const FavoriteLocationWidget({Key? key, required this.favoriteLocationList})
      : super(key: key);

  final List<Locate> favoriteLocationList;

  @override
  Widget build(BuildContext context) {
    return favoriteLocationList.isEmpty
        ? const NotFoundWidget(title: 'У вас пока нет избранных локаций')
        : LocationCardWidget(location: favoriteLocationList);
  }
}
