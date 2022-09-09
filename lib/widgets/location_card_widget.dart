import 'package:flutter/material.dart';
import 'package:wheather_app/constants/app_styles.dart';
import 'package:wheather_app/ui/main_screen.dart';
import '../constants/app_assets.dart';
import '../model/location.dart';
import 'add_remove_favorite_widget.dart';

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
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(AppAssets.images.cloudy)),
              ),
              const SizedBox(width: 15),
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
                        AddRemoveFavoriteWidget(
                          isFavorite: location[index].isFavorite!,
                          id: location[index].id.toString(),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      location[index].id!,
                      style: AppStyles.s16w400,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      location[index].degree!.toString(),
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
