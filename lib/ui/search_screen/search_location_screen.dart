import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/app_styles.dart';

import '../../bloc/search_location/bloc_location.dart';
import '../../widgets/location_card_widget.dart';
import 'widgets/search_field.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SearchField(
                onChanged: (value) {
                  BlocProvider.of<BlocLocation>(context).add(
                    EventSearchByCityName(cityName: value),
                  );
                },
                controller: controller,
              ),
              Expanded(
                child: BlocBuilder<BlocLocation, StateBlocLocation>(
                  builder: (context, state) {
                    if (state is StateLocationError) {
                      return const Center(child: Text('Something Error'));
                    }
                    if (state is StateLocationLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (state is StateLocationData) {
                      if (controller.text.isEmpty) {
                        if (state.favoritesData!.isNotEmpty) {
                          return LocationCardWidget(
                            location: state.favoritesData!,
                          );
                        } else {
                          return const Center(
                            child: Text(
                              'У вас пока нет избранных локаций',
                              style: AppStyles.s16w400,
                            ),
                          );
                        }
                      } else {
                        return state.data.isNotEmpty
                            ? LocationCardWidget(
                                location: state.data,
                              )
                            : const Center(
                                child: Text(
                                  'По вашему запросу ничего не найдено',
                                  style: AppStyles.s16w400,
                                ),
                              );
                      }
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
