import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weather_app/bloc/search_location/bloc_location.dart';

import '../../../constants/app_assets.dart';

class SearchFieldWidget extends StatelessWidget {
  const SearchFieldWidget({Key? key, required this.controller})
      : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (value.isNotEmpty) {
          BlocProvider.of<BlocLocation>(context).add(
            EventSearchByCityName(cityName: value),
          );
        } else {
          BlocProvider.of<BlocLocation>(context).add(
            EventShowHistoryLocation(),
          );
        }
      },
      onTap: () => {
        if (controller.text.isEmpty)
          {
            BlocProvider.of<BlocLocation>(context).add(
              EventShowHistoryLocation(),
            )
          }
      },
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Поиск локации',
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        prefixIcon: GestureDetector(
          onTap: () {
            BlocProvider.of<BlocLocation>(context)
                .add(EventSelectedLocation(id: ''));
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SvgPicture.asset(
              AppAssets.svg.backArrow,
            ),
          ),
        ),
        suffixIcon: GestureDetector(
          onTap: () =>
              BlocProvider.of<BlocLocation>(context).add(EventFindLocation()),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: SvgPicture.asset(
              AppAssets.svg.focus,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1,
            color: Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
