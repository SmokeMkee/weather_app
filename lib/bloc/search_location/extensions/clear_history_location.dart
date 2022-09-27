part of '../bloc_location.dart';

extension ClearHistoryLocation on BlocLocation {
  _eventClearHistoryLocation(
    EventClearHistoryLocation event,
    Emitter<StateBlocLocation> emit,
  ) {
    emit(StateLocationLoading());
    historyData.clear();
    emit(StateLocationHistory(historyData: historyData));
  }
}
