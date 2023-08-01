import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather_cunbit/weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/pages/home_page.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => WeatherCubit(WeatherService()),
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch:
            BlocProvider.of<WeatherCubit>(context).weatherModel == null
                ? Colors.blue
                : BlocProvider.of<WeatherCubit>(context)
                    .weatherModel!
                    .getThemeColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
