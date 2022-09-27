part of '../bloc_location.dart';

extension AddRemoveFavoriteLocation on BlocLocation {
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
          selectedLocation: selectedLocation,
          historyData: historyData),
    );
  }
}
