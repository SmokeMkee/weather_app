import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/constants/app_assets.dart';
import 'package:weather_app/constants/app_colors.dart';
import 'package:weather_app/constants/app_styles.dart';
import 'package:weather_app/model/location.dart';
import 'package:weather_app/ui/search_location_screen.dart';
import 'package:weather_app/widgets/choice_location_button_widget.dart';
import 'package:weather_app/widgets/main_menu_info_widget.dart';

import '../bloc/location/bloc_location.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, this.location}) : super(key: key);
  final Location? location;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      child: SvgPicture.asset(
                        AppAssets.svg.location,
                        color: Colors.white,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SearchLocationScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        widget.location == null
                            ? 'Город не определен'
                            : widget.location!.cityName!,
                        style: AppStyles.s16w600,
                      ),
                    ),
                    widget.location == null
                        ? const Text('')
                        : GestureDetector(
                            onTap: () {
                              setState(
                                () {
                                  widget.location!.isFavorite =
                                      !widget.location!.isFavorite!;
                                },
                              );
                              BlocProvider.of<BlocLocation>(context).add(
                                EventAddFavoritesById(
                                  id: int.tryParse(widget.location!.id!),
                                ),
                              );
                            },
                            child: Icon(
                              widget.location!.isFavorite == true
                                  ? Icons.star
                                  : Icons.star_border_outlined,
                              color: Colors.white,
                            ),
                          )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.images.cloudy,
                      width: 200,
                    ),
                    Text(
                      widget.location == null
                          ? '-'
                          : widget.location!.degree.toString(),
                      style: AppStyles.s48w600,
                    ),
                    Text(
                      widget.location == null
                          ? '-'
                          : widget.location!.status.toString(),
                      style: AppStyles.s20w600,
                    )
                  ],
                ),
              ),
              const Spacer(),
              widget.location == null
                  ? const ChoiceLocationButtonWidget()
                  : MainMenuInfoWidget(location: widget.location!)
            ],
          ),
        ),
      ),
    );
  }
}
