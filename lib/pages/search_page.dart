import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:weather/cubits/weather_cunbit/weather_cubit.dart';
import 'package:weather/models/weather_model.dart';
import 'package:weather/providers/weather_provider.dart';
import 'package:weather/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;

  SearchPage({this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (city) {
              cityName = city;
            },
            onSubmitted: (city) async {
              cityName = city;
              BlocProvider.of<WeatherCubit>(context)
                  .getWeather(cityName: cityName!);

              BlocProvider.of<WeatherCubit>(context).cityName = city;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                label: Text('search'),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                hintText: 'Enter a City',
                border: OutlineInputBorder(),
                suffixIcon: GestureDetector(
                    onTap: () async {
                      WeatherService service = WeatherService();
                      WeatherModel? weather =
                          await service.getWeather(cityName: cityName!);
                      BlocProvider.of<WeatherCubit>(context).weatherModel =
                          weather;

                      BlocProvider.of<WeatherCubit>(context, listen: false)
                          .cityName = cityName;

                      Navigator.pop(context);
                    },
                    child: Icon(Icons.search))),
          ),
        ),
      ),
    );
  }
}
