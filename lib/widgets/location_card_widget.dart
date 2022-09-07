import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wheather_app/bloc/location/bloc_location.dart';
import 'package:wheather_app/constants/app_colors.dart';
import 'package:wheather_app/constants/app_styles.dart';
import 'package:wheather_app/ui/main_screen.dart';

import '../constants/app_assets.dart';
import '../model/location.dart';

class LocationCardWidget extends StatelessWidget {
  const LocationCardWidget({Key? key, required this.location})
      : super(key: key);
  final List<Location> location;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, int index) {
        return InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(
                  location: location[index],
                ),
              ),
            );
          },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  AppAssets.svg.cloudy,
                  width: 120,
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            location[index].cityName.toString(),
                            style: AppStyles.s20w600.copyWith(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<BlocLocation>(context).add(
                              EventAddFavoritesById(
                                id: int.tryParse(location[index].id!),
                              ),
                            );
                            final snackBar = SnackBar(
                              duration: const Duration(seconds: 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              behavior: SnackBarBehavior.floating,
                              padding: const EdgeInsets.all(10),
                              elevation: 3,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              content: Row(
                                children: [
                                  const Icon(Icons.check_circle_outline),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        location[index].isFavorite!
                                            ? 'Локация удалена'
                                            : 'Локация добавлена в избранное',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              backgroundColor: (Colors.white),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          },
                          child: location[index].isFavorite!
                              ? const Icon(
                                  Icons.star,
                                  color: AppColors.accentDark,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.star_border_outlined,
                                  color: AppColors.accentDark,
                                  size: 30,
                                ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      location[index].id!,
                      style: AppStyles.s16w400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      location[index].gradus!.toString(),
                      style: AppStyles.s20w600.copyWith(
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, int index) {
        return const Divider(
          height: 2,
          thickness: 1,
        );
      },
      itemCount: location.length,
    );
  }
}
