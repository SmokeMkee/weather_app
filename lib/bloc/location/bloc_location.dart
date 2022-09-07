import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/repo/repo_location.dart';
import '../../model/location.dart';

part 'states.dart';

part 'events.dart';

class BlocLocation extends Bloc<EventBlocLocation, StateBlocLocation> {
  final RepoLocation repo;
  List<Location> sortedList = [];
  List<Location> favoriteList = [];

  BlocLocation({required this.repo}) : super(StateLocationInitial()) {
    on<EventSearchByCityName>(_eventSearchByCityName);
    on<EventAddFavoritesById>(_addFavorite);
  }

  _eventSearchByCityName(
    EventSearchByCityName event,
    Emitter<StateBlocLocation> emit,
  ) async {
    emit(StateLocationLoading());
    final result = await repo.filterByName(event.cityName);

    sortedList = result.productList!
        .where((element) => element.cityName!
            .toLowerCase()
            .contains(event.cityName.trim().toLowerCase()))
        .toList();

    if (result.errorMessage != null) {
      emit(
        StateLocationError(error: result.errorMessage!),
      );
      return;
    }

    emit(
      StateLocationData(data: sortedList, favoritesData: favoriteList),
    );
  }

  _addFavorite(
    EventAddFavoritesById event,
    Emitter<StateBlocLocation> emit,
  ) async {
    var result = await repo.addFavoriteLocation(event.id!);

    if (favoriteList.isEmpty) {
      favoriteList.add(result.favoritesLocation!);
      sortedList[sortedList
              .indexWhere((element) => element.id == event.id.toString())]
          .isFavorite = true;
    } else if (favoriteList
        .any((element) => element.id == result.favoritesLocation!.id)) {
      favoriteList.removeAt(favoriteList
          .indexWhere((element) => element.id == event.id.toString()));
      sortedList[sortedList
              .indexWhere((element) => element.id == event.id.toString())]
          .isFavorite = false;
    } else {
      favoriteList.add(result.favoritesLocation!);
      sortedList[sortedList
              .indexWhere((element) => element.id == event.id.toString())]
          .isFavorite = true;
    }

    emit(
      StateLocationData(favoritesData: favoriteList, data: sortedList),
    );
  }
}
