

import 'package:flutter/material.dart';
import 'package:weather/controller/contoller.dart';
import 'package:weather/model/weathermodel.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final weatherdata = Contoller(api: 'ff54b99ea3120f22f07213e81bddff1d');
  WeatherApi? _weather;

  fetchdta() async {
    String cityName = await weatherdata.getLoctionz();

    try {
      final weaTher = await weatherdata.fetchweatherdata(cityName);
      setState(() {
        _weather = weaTher;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetchdta();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(_weather?.cityName ?? "loading data "),
      
        Text('${_weather?.temp.round()}°C')
          ],
          
        ),
      ),
    );
  }
}
