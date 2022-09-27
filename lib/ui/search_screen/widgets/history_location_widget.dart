import 'package:flutter/material.dart';
import 'package:weather_app/ui/search_screen/widgets/history_widget.dart';
import 'package:weather_app/widgets/not_found_widget.dart';

import '../../../model/location.dart';

class HistoryLocationWidget extends StatelessWidget {
  const HistoryLocationWidget({Key? key, required this.historyLocationList})
      : super(key: key);

  final List<Locate> historyLocationList;

  @override
  Widget build(BuildContext context) {
    return historyLocationList.isEmpty
        ? const NotFoundWidget(title: 'Введите название города')
        : HistoryWidget(locationListHistory: historyLocationList);
  }
}
