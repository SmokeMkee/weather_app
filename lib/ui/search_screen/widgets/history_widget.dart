import 'package:flutter/material.dart';
import 'package:weather_app/ui/search_screen/widgets/history_header_widget.dart';

import '../../../model/location.dart';
import 'history_card_widget.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({Key? key, required this.locationListHistory})
      : super(key: key);
  final List<Locate> locationListHistory;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HistoryHeaderWidget(),
        HistoryCardWidget(locationListHistory: locationListHistory)
      ],
    );
  }
}
