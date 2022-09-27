import 'package:flutter/material.dart';

import '../../../constants/app_assets.dart';
import '../../../constants/app_styles.dart';
import '../../../model/location.dart';

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({Key? key, required this.locationListHistory})
      : super(key: key);
  final List<Locate> locationListHistory;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, int index) {
          return Row(
            children: [
              Image.asset(
                AppAssets.images.cloudy,
                width: 50,
              ),
              const SizedBox(
                width: 15,
              ),
              Text(
                locationListHistory[index].cityName,
                style: AppStyles.s16w600.copyWith(color: Colors.black),
              ),
              const Spacer(),
              Text(
                locationListHistory[index].degree.toString(),
                style: AppStyles.s16w400.copyWith(
                  color: Colors.black,
                ),
              )
            ],
          );
        },
        separatorBuilder: (context, int index) {
          return const Divider(
            height: 2,
            thickness: 1,
          );
        },
        itemCount: locationListHistory.length,
      ),
    );
  }
}
