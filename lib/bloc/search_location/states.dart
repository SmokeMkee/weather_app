part of 'bloc_location.dart';

abstract class StateBlocLocation {}

class StateLocationInitial extends StateBlocLocation {}

class StateLocationLoading extends StateBlocLocation {}

class StateLocationData extends StateBlocLocation {
  StateLocationData({required this.data, this.favoritesData,this.selectedLocation, });

  final List<Location> data;
  final List<Location>? favoritesData;
  final Location? selectedLocation;
}

class StateLocationError extends StateBlocLocation {
  StateLocationError({
    required this.error,
  });

  final String error;
}
