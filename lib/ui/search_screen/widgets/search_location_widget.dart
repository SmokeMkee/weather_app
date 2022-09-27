import 'package:flutter/material.dart';
import 'package:weather_app/widgets/location_card_widget.dart';
import 'package:weather_app/widgets/not_found_widget.dart';

import '../../../model/location.dart';

class SearchLocationWidget extends StatelessWidget {
  const SearchLocationWidget({Key? key, required this.searchLocationList})
      : super(key: key);

  final List<Locate> searchLocationList;

  @override
  Widget build(BuildContext context) {
    return searchLocationList.isEmpty
        ? const NotFoundWidget(title: 'По вашему запросу ничего не найдено')
        : LocationCardWidget(location: searchLocationList);
  }
}
