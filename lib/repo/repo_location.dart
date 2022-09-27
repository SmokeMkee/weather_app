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
            (e) => Locate.fromJson(e),
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

  Future<ResultRepoLocation> selectLocation(String id) async {
    try {
      final result = await api.dio.get(
        'location/$id',
      );
      final locationJson = result.data;
      final selectedLocation = Locate.fromJson(locationJson);
      return ResultRepoLocation(selectedLocation: selectedLocation);
    } catch (error) {
      if (kDebugMode) {
        print("Error : $error");
      }
      return ResultRepoLocation(errorMessage: "Error");
    }
  }
}

class ResultRepoLocation {
  ResultRepoLocation({
    this.selectedLocation,
    this.errorMessage,
    this.locationList,
  });

  final String? errorMessage;
  final List<Locate>? locationList;
  final Locate? selectedLocation;
}
