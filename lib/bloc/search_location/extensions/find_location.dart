// ignore_for_file: invalid_use_of_visible_for_testing_member

part of '../bloc_location.dart';

extension FindLocation on BlocLocation {
  _eventFindLocation(
    EventFindLocation event,
    Emitter<StateBlocLocation> emit,
  ) async {
    emit(StateLocationLoading());

    _getCurrentPosition();
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(StateLocationPermissionsDenied(
          title: 'Location services are disabled. Please enable the services'));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(StateLocationPermissionsDenied(
            title: 'Location permissions are denied'));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      emit(StateLocationPermissionsDenied(
          title:
              'Location permissions are permanently denied, we cannot request permissions.'));
      return false;
    }
    return true;
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placeMark) {
      Placemark place = placeMark[0];

      _currentAddress =
          '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      emit(StateLocationFind(location: _currentAddress!));
    }).catchError((e) {
      debugPrint(e);
    });
  }
}

