part of '../bloc_location.dart';

extension ShowFavoritesLocation on BlocLocation {
  _eventShowFavoritesLocation(
    EventShowFavoriteLocation event,
    Emitter<StateBlocLocation> emit,
  ) {
    emit(StateLocationLoading());
    emit(StateLocationFavorite(
        favoritesData: favoriteList,
        data: sortedList,
        selectedLocation: selectedLocation,
        historyData: historyData));
  }
}
