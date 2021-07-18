//import 'dart:ui';

//import 'package:allskills/utils/weather_data.dart';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:allskills/utils/constants.dart';
import 'package:weather/weather.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class WeatherWidget extends StatefulWidget {
  WeatherWidget({Key? key}) : super(key: key);

  @override
  _WeatherIconState createState() => _WeatherIconState();
}

class _WeatherIconState extends State<WeatherWidget> {
  bool isLoading = true;
  bool downloaded = false;
  late Weather _data;
  late WeatherFactory wf;
  late Future<String> _weatherIcon;
  @override
  void initState() {
    super.initState();
    wf = new WeatherFactory(OPENWEATHER_API);
  }

  loadWeather() async {
    final lat = 45.508888;
    final lon = -73.561668;
    Weather w;

    try {
      Weather w = await wf.currentWeatherByLocation(lat, lon);
      downloaded = true;
      return w;
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new FutureBuilder<dynamic>(
      future: loadWeather(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> currWeather) {
        if (currWeather.hasData) {
          return Row(children: [
            Image.network('http://openweathermap.org/img/wn/' +
                currWeather.data!.weatherIcon! +
                '.png'),
            Text(currWeather.data!.temperature!.celsius!.toStringAsFixed(0) +
                ' °C')
          ]);
        } else {
          return Container();
        }
      },
    );
  }
}

// class WeatherIcon extends StatelessWidget {
//   const WeatherIcon({Key? key, }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: null,
//     );
//   }
// }