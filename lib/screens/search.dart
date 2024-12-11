// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/Services/getdate.dart';
import 'package:weather/cubits/weather_cubit.dart';

import 'package:provider/provider.dart';
import 'package:weather/provider/weatherProvider.dart';
import 'package:weather/widgets/search_widget.dart';

class Search extends StatelessWidget {
  Search({super.key});

  String? cityName;
  GetData getData = GetData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search page'),
      ),
      body: BlocProvider(
        create: (context) => WeatherCubit(getData: GetData()),
        child: BlocBuilder<WeatherCubit, WeatherState>(
          builder: (context, state) {
            if (state is WeatherLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          BlocProvider.of<WeatherCubit>(context).refreshPage();
                        },
                        child: const Text('try again'))
                  ],
                ),
              );
            } else if (state is WeatherSuccess) {
              // Provider.of<WeatherProvider>(context, listen: false).weather =
              //     state.weather;
              // print(cityName);
              // print('-----------------------------');
              // Provider.of<WeatherProvider>(context, listen: false).city =
              //     cityName;
              Navigator.pop(context);
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SearchWidget(
                onSubmitted: (value) {
                  cityName = value;

                  BlocProvider.of<WeatherCubit>(context)
                      .getWeather(cityName: cityName!);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
