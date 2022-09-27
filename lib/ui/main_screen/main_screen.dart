import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/search_location/bloc_location.dart';
import 'package:weather_app/constants/app_assets.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/ui/main_screen/widgets/selected_location_widget.dart';
import 'package:weather_app/widgets/on_error_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.accentDark,
      body: SafeArea(
        bottom: false,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppAssets.images.bgDelimiter),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<BlocLocation, StateBlocLocation>(
                  builder: (context, state) {
                    if (state is StateLocationError) {
                      return const OnErrorWidget(
                          errorTitle: 'Что то пошло не так');
                    }
                    if (state is StateLocationData) {
                      return SelectedLocationWidget(
                          location: state.selectedLocation);
                    }
                    if (state is StateLocationLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      );
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
