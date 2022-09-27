part of 'bloc_location.dart';

abstract class StateBlocLocation {}

class StateLocationInitial extends StateBlocLocation {}

class StateLocationLoading extends StateBlocLocation {}

class StateLocationData extends StateBlocLocation {
  StateLocationData(
      {required this.data,
      this.favoritesData,
      this.historyData,
      this.selectedLocation,
      this.locationTitle});

  final List<Locate> data;
  final List<Locate>? favoritesData;
  final List<Locate>? historyData;
  final Locate? selectedLocation;
  final String? locationTitle;
}

class StateLocationFavorite extends StateBlocLocation {
  StateLocationFavorite({
    this.data,
    required this.favoritesData,
    this.historyData,
    this.selectedLocation,
  });

  final List<Locate>? data;
  final List<Locate> favoritesData;
  final List<Locate>? historyData;
  final Locate? selectedLocation;
}

class StateLocationHistory extends StateBlocLocation {
  final List<Locate> historyData;

  StateLocationHistory({
    required this.historyData,
  });
}

class StateLocationFind extends StateBlocLocation {
  final String location;

  StateLocationFind({required this.location});
}

class StateLocationPermissionsDenied extends StateBlocLocation {
  final String title;

  StateLocationPermissionsDenied({required this.title});
}

class StateLocationError extends StateBlocLocation {
  StateLocationError({
    required this.error,
  });

  final String error;
}
