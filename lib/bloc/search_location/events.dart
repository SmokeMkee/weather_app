part of 'bloc_location.dart';

abstract class EventBlocLocation {}

class EventSearchByCityName extends EventBlocLocation {
  final String cityName;

  EventSearchByCityName({required this.cityName});
}

class EventAddRemoveFavoritesById extends EventBlocLocation {
  final String id;

  EventAddRemoveFavoritesById({required this.id});
}

