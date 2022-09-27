part of '../bloc_location.dart';

extension SelectedLocation on BlocLocation {
  _eventSelectedLocation(
    EventSelectedLocation event,
    Emitter<StateBlocLocation> emit,
  ) async {
    emit(StateLocationLoading());
    if (event.id.isNotEmpty) {
      selectedLocation =
          sortedList.where((element) => element.id == event.id).first;
      if (historyData.isEmpty ||
          historyData.any((element) => element.id != event.id)) {
        historyData.add(selectedLocation!);
      }
    }

    emit(
      StateLocationData(
          selectedLocation: selectedLocation,
          data: sortedList,
          historyData: historyData,
          favoritesData: favoriteList),
    );
  }
}
