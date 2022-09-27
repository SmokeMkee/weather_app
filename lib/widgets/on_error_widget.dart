import 'package:flutter/material.dart';

class OnErrorWidget extends StatelessWidget {
  const OnErrorWidget({Key? key, required this.errorTitle}) : super(key: key);
  final String errorTitle;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('errorTitle'),
    );
  }
}
