part of 'bloc_location.dart';

abstract class StateBlocLocation {}

class StateLocationInitial extends StateBlocLocation {}

class StateLocationLoading extends StateBlocLocation {}

class StateLocationData extends StateBlocLocation {
  StateLocationData({required this.data, this.favoritesData});

  final List<Location> data;
  final List<Location>? favoritesData;
}

class StateLocationError extends StateBlocLocation {
  StateLocationError({
    required this.error,
  });

  final String error;
}
