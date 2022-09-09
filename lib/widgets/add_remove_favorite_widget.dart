import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/constants/app_styles.dart';
import '../bloc/location/bloc_location.dart';
import '../constants/app_colors.dart';

class AddRemoveFavoriteWidget extends StatelessWidget {
  const AddRemoveFavoriteWidget(
      {Key? key, required this.id, required this.isFavorite})
      : super(key: key);

  final String id;
  final bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<BlocLocation>(context).add(
          EventAddFavoritesById(
            id: int.tryParse(id),
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
                    isFavorite
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
      child: isFavorite
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
    );
  }
}
