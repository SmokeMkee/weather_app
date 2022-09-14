import 'package:flutter/foundation.dart';

import '../model/location.dart';
import 'api.dart';

class RepoLocation {
  final Api api;

  RepoLocation({required this.api});

  Future<ResultRepoLocation> filterByName(String cityName) async {
    try {
      final result = await api.dio.get(
        'location',
      );
      final List locationListJson = result.data;
      final locationList = locationListJson
          .map(
            (e) => Location.fromJson(e),
          )
          .toList();
      return ResultRepoLocation(locationList: locationList);
    } catch (error) {
      if (kDebugMode) {
        print("Error : $error");
      }
      return ResultRepoLocation(errorMessage: "");
    }
  }
}

class ResultRepoLocation {
  ResultRepoLocation({
    this.errorMessage,
    this.locationList,
  });

  final String? errorMessage;
  final List<Location>? locationList;
}
