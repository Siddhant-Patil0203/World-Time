import 'package:flutter/material.dart';
import 'package:world_time_weather_app/pages/choose_location.dart';
import 'package:world_time_weather_app/pages/loading.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const  Home(),
      '/location': (context) => const ChooseLocation(),
    },
  ));


