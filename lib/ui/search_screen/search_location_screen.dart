import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/ui/search_screen/widgets/favorite_location_widget.dart';
import 'package:weather_app/ui/search_screen/widgets/history_location_widget.dart';
import 'package:weather_app/ui/search_screen/widgets/search_location_widget.dart';

import '../../bloc/search_location/bloc_location.dart';
import '../../widgets/on_error_widget.dart';
import 'widgets/search_field_widget.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus && controller.text.isEmpty) {
          BlocProvider.of<BlocLocation>(context)
              .add(EventShowFavoriteLocation());
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SearchFieldWidget(
                  controller: controller,
                ),
                Expanded(
                  child: BlocBuilder<BlocLocation, StateBlocLocation>(
                    builder: (context, state) {
                      if (state is StateLocationError) {
                        return const OnErrorWidget(
                          errorTitle: 'Что то пошло не так',
                        );
                      }
                      if (state is StateLocationLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state is StateLocationFavorite) {
                        return FavoriteLocationWidget(
                          favoriteLocationList: state.favoritesData,
                        );
                      }
                      if (state is StateLocationHistory) {
                        return HistoryLocationWidget(
                          historyLocationList: state.historyData,
                        );
                      }
                      if (state is StateLocationData) {
                        return SearchLocationWidget(
                          searchLocationList: state.data,
                        );
                      }

                      if (state is StateLocationPermissionsDenied) {
                        return Center(child: Text(state.title));
                      }
                      if (state is StateLocationFind) {
                        return Center(child: Text(state.location));
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
