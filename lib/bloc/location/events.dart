part of 'bloc_location.dart';

abstract class EventBlocLocation {}

class EventSearchByCityName extends EventBlocLocation {
  final String cityName;

  EventSearchByCityName({required this.cityName});
}

class EventAddFavoritesById extends EventBlocLocation {
  final int? id;

  EventAddFavoritesById({this.id});
}

class EventRemoveFavoritesById extends EventBlocLocation {
  final int id;

  EventRemoveFavoritesById({required this.id});
}
