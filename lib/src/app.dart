import 'package:dream_home/src/common/provider/bloc_provider.dart';
import 'package:dream_home/src/routes.dart';
import 'package:dream_home/src/theme/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// [DreamHome] class is the root widget of the app.
class DreamHome extends StatelessWidget {
  const DreamHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
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
