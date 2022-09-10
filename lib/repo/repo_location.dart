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
      return ResultRepoLocation(productList: locationList);
    } catch (error) {
      if (kDebugMode) {
        print("Error : $error");
      }
      return ResultRepoLocation(errorMessage: "");
    }
  }

  Future<ResultRepoLocation> addFavoriteLocation(int id) async {
    try {
      final result = await api.dio.get(
        'location/$id',
      );

      final locationJson = result.data;
      final locationFavorites = Location.fromJson(locationJson);
      locationFavorites.isFavorite = true;
      return ResultRepoLocation(favoritesLocation: locationFavorites);
    } catch (error) {
      if (kDebugMode) {
        print("Error : $error");
      }
      return ResultRepoLocation(errorMessage: "s");
    }
  }
}

class ResultRepoLocation {
  ResultRepoLocation({
    this.favoritesLocation,
    this.errorMessage,
    this.productList,
  });

  final String? errorMessage;
  final List<Location>? productList;
  final Location? favoritesLocation;
}
