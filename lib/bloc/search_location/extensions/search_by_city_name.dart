part of '../bloc_location.dart';

extension SearchByCityName on BlocLocation {
  Future<void> _eventSearchByCityName(
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
          locationTitle: event.cityName,
          data: sortedList,
          favoritesData: favoriteList,
          selectedLocation: selectedLocation,
          historyData: historyData),
    );
  }
}
