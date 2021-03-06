import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madolo_217006168/models/weather_data.dart';
import 'package:provider/provider.dart';

class WeatherCard extends StatelessWidget {
  @override
  const WeatherCard({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    context.read<WeatherData>().fetchData;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: Consumer<WeatherData>(
          builder: (context, value, child) {
            return value.map.length == 0 && !value.error
                ? Center(child: CircularProgressIndicator())
                : value.error
                    ? Text(
                        'Something went wrong while fetcjing Data. ${value.error}')
                    : ListView.builder(
                        itemCount: 7,
                        //value.map['Cape Town'].legnth,
                        itemBuilder: (context, index) {
                          return CardWeather(
                            map: value.map['Cape Town'][index],
                          );
                        },
                      );
          },
        ),
      ),
    );
  }
}

class CardWeather extends StatelessWidget {
  final Map<String, dynamic> map;
  const CardWeather({Key key, @required this.map}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic today =
        DateFormat('EEEE').format(DateTime.now()) == '${map['day']}';
    return Container(
      child: Card(
        color: today ? Colors.blue : Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (DateFormat('EEEE').format(DateTime.now()) != '${map['day']}')
                Text(
                  '${map['day']} ',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              if (DateFormat('EEEE').format(DateTime.now()) == '${map['day']}')
                Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              Row(
                children: [
                  Image.asset(
                    'assets/images/humidity.png',
                    height: 20,
                    width: 20,
                  ),
                  Text(
                    '${map['humidity']}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  if ('${map['condition_day']}' == 'Cloudy')
                    Image.asset(
                      'assets/images/cloudy_day.png',
                      height: 25,
                      width: 25,
                    ),
                  if ('${map['condition_day']}' == 'Rain')
                    Image.asset(
                      'assets/images/rain.png',
                      height: 25,
                      width: 25,
                    ),
                  if ('${map['condition_day']}' == 'Fair')
                    Image.asset(
                      'assets/images/fair_day.png',
                      height: 25,
                      width: 25,
                    ),
                  // night condition logic
                  if ('${map['condition_night']}' == 'Cloudy')
                    Image.asset(
                      'assets/images/cloudy_night.png',
                      height: 25,
                      width: 25,
                    ),
                  if ('${map['condition_night']}' == 'Rain')
                    Image.asset(
                      'assets/images/rain.png',
                      height: 25,
                      width: 25,
                    ),
                  if ('${map['condition_night']}' == 'Fair')
                    Image.asset(
                      'assets/images/fair_night.png',
                      height: 25,
                      width: 25,
                    ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    '${map['maxtemp']}\u00b0/${map['mintemp']}\u00b0',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
