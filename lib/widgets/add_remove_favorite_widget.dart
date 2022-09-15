import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants/app_styles.dart';
import 'package:weather_app/model/location.dart';
import '../bloc/search_location/bloc_location.dart';

class AddRemoveFavoriteWidget extends StatelessWidget {
  const AddRemoveFavoriteWidget(
      {Key? key,
      required this.isFavoriteColor,
      required this.isNotFavoriteColor,
      required this.location})
      : super(key: key);
  final Location location;
  final Color isFavoriteColor;
  final Color isNotFavoriteColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BlocLocation>(context).add(
          EventAddRemoveFavoritesById(id: location.id),
        );

        final snackBar = SnackBar(
          duration: const Duration(seconds: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          behavior: SnackBarBehavior.floating,
          padding: const EdgeInsets.all(10),
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
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
                    location.isFavorite
                        ? 'Локация удалена'
                        : 'Локация добавлена в избранное',
                    style: AppStyles.s16w400,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: (Colors.white),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      child: location.isFavorite
          ? Icon(
              Icons.star,
              color: isFavoriteColor,
              size: 30,
            )
          : Icon(
              Icons.star_border_outlined,
              color: isNotFavoriteColor,
              size: 30,
            ),
    );
  }
}
