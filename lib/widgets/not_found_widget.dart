import 'package:flutter/material.dart';

import '../constants/app_styles.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: AppStyles.s16w400,
      ),
    );
  }
}
