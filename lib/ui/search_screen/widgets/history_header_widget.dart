import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/search_location/bloc_location.dart';
import '../../../constants/app_colors.dart';
import '../../../constants/app_styles.dart';

class HistoryHeaderWidget extends StatelessWidget {
  const HistoryHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'История поиска',
            style: AppStyles.s16w400,
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<BlocLocation>(context)
                  .add(EventClearHistoryLocation());
            },
            child: Text(
              'Очистить',
              style: AppStyles.s16w400.copyWith(color: AppColors.accentDark),
            ),
          )
        ],
      ),
    );
  }
}
