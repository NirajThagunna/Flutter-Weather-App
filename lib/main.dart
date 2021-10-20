import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_and_cubit_design_pattern/bloc/weather_bloc.dart';
import 'package:flutter_bloc_and_cubit_design_pattern/data/weather_repository.dart';
import 'package:flutter_bloc_and_cubit_design_pattern/pages/weather_search_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: BlocProvider(
        create: (context) => WeatherBloc(FakeWeatherRepository()),
        child: const WeatherSearchPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
