part of '../bloc_location.dart';

extension ShowHistoryLocation on BlocLocation {
  _eventShowHistoryLocation(
    EventShowHistoryLocation event,
    Emitter<StateBlocLocation> emit,
  ) {
    emit(StateLocationLoading());
    emit(StateLocationHistory(
      historyData: historyData,
    ));
  }
}
