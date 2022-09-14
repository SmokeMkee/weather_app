import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/repo/repo_location.dart';

import '../bloc/search_location/bloc_location.dart';
import '../repo/api.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        RepositoryProvider(
          create: (context) => Api(),
        ),
        Provider(
          create: (context) => RepoLocation(
            api: RepositoryProvider.of<Api>(context),
          ),
        ),
      ],
      child: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => BlocLocation(
            repo: RepositoryProvider.of<RepoLocation>(context),
          )..add(EventSearchByCityName(cityName: '')),
        ),
      ], child: child),
    );
  }
}
