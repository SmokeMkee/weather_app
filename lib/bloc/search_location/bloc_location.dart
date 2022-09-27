import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/location.dart';
import 'package:weather_app/repo/repo_location.dart';

part 'events.dart';
part 'extensions/add_remove_favorite_location.dart';
part 'extensions/clear_history_location.dart';
part 'extensions/find_location.dart';
part 'extensions/search_by_city_name.dart';
part 'extensions/selected_location.dart';
part 'extensions/show_favorites_location.dart';
part 'extensions/show_history_location.dart';
part 'states.dart';

class BlocLocation extends Bloc<EventBlocLocation, StateBlocLocation> {
  List<String> statusWeather = [
    'assets/images/bitmap/cloudy.png',
    'assets/images/bitmap/night.png',
    'assets/images/bitmap/rain.png',
    'assets/images/bitmap/snowy.png',
    'assets/images/bitmap/sun.png',
    'assets/images/bitmap/sun_cloudy.png',
    'assets/images/bitmap/thunder.png',
  ];

  final RepoLocation repo;
  List<Locate> sortedList = [];
  List<Locate> favoriteList = [];
  Locate? selectedLocation;
  List<Locate> historyData = [];
  String? _currentAddress;
  Position? _currentPosition;

  BlocLocation({required this.repo}) : super(StateLocationInitial()) {
    on<EventSearchByCityName>(_eventSearchByCityName);
    on<EventAddRemoveFavoritesById>(_addRemoveFavorite);
    on<EventSelectedLocation>(_eventSelectedLocation);
    on<EventShowHistoryLocation>(_eventShowHistoryLocation);
    on<EventShowFavoriteLocation>(_eventShowFavoritesLocation);
    on<EventClearHistoryLocation>(_eventClearHistoryLocation);
    on<EventFindLocation>(_eventFindLocation);
  }
}
