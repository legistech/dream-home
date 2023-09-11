import 'common/provider/bloc_provider.dart';
import 'routes.dart';
import 'theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [DreamHome] class is the root widget of the app.
class DreamHome extends StatelessWidget {
  const DreamHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      /// [blocProviders] is a list of all the blocs used in the app.
      /// To add a new bloc, add it to the list of [blocProviders].

      providers: Providers.blocProviders,
      child: MaterialApp(
        title: 'Dream Home',
        initialRoute: '/',
        onGenerateRoute: (settings) =>
            GenerateRoutes.onGenerateRoutes(settings),
        debugShowCheckedModeBanner: false,
        theme: getThemeData(),
      ),
    );
  }
}
