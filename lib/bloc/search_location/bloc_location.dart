import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/repo/repo_location.dart';

import '../../model/location.dart';

part 'events.dart';
part 'states.dart';

class BlocLocation extends Bloc<EventBlocLocation, StateBlocLocation> {
  List<String> statusWeather = [
    'assets/images/bitmap/cloudy.png',
    'assets/images/bitmap/night.png',
    'assets/images/bitmap/rain.png',
    'assets/images/bitmap/snowy.png',
    'assets/images/bitmap/sun.png',
    'assets/images/bitmap/sun_cloudy.png',
    'assets/images/bitmap/thunder.png',
  ];

  final RepoLocation repo;
  List<Location> sortedList = [];
  List<Location> favoriteList = [];
  Location? selectedLocation;

  BlocLocation({required this.repo}) : super(StateLocationInitial()) {
    on<EventSearchByCityName>(_eventSearchByCityName);
    on<EventAddRemoveFavoritesById>(_addRemoveFavorite);
    on<EventSelectedLocation>(_eventSelectedLocation);
  }

  _eventSearchByCityName(
    EventSearchByCityName event,
    Emitter<StateBlocLocation> emit,
  ) async {
    emit(StateLocationLoading());
    final result = await repo.filterByName(event.cityName);

    sortedList = result.locationList!.where((element) {
      for (var element in element.weather) {
        element.status = statusWeather[Random().nextInt(statusWeather.length)];
      }

      if (favoriteList.any((e) => e.id == element.id)) {
        element.isFavorite = true;
      }

      return element.cityName
          .toLowerCase()
          .contains(event.cityName.trim().toLowerCase());
    }).toList();

    if (result.errorMessage != null) {
      emit(
        StateLocationError(error: result.errorMessage!),
      );
      return;
    }

    emit(
      StateLocationData(
        data: sortedList,
        favoritesData: favoriteList,
        selectedLocation: selectedLocation,
      ),
    );
  }

  _eventSelectedLocation(
    EventSelectedLocation event,
    Emitter<StateBlocLocation> emit,
  ) async {
    emit(StateLocationInitial());
    selectedLocation =
        sortedList.where((element) => element.id == event.id).first;
    if (selectedLocation == null) {
      emit(
        StateLocationError(error: 'error'),
      );
    }

    emit(
      StateLocationData(
        selectedLocation: selectedLocation,
        data: sortedList,
        favoritesData: favoriteList,
      ),
    );
  }

  _addRemoveFavorite(
    EventAddRemoveFavoritesById event,
    Emitter<StateBlocLocation> emit,
  ) async {
    var id = sortedList.indexWhere((element) => element.id == event.id);
    if (favoriteList.isNotEmpty &&
        favoriteList.any((element) => element.id == event.id)) {
      favoriteList.removeAt(
          favoriteList.indexWhere((element) => element.id == event.id));
      sortedList[id].isFavorite = false;
    } else {
      favoriteList
          .add(sortedList.firstWhere((element) => element.id == event.id));
      sortedList[id].isFavorite = true;
    }

    emit(
      StateLocationData(
          favoritesData: favoriteList,
          data: sortedList,
          selectedLocation: selectedLocation),
    );
  }
}
