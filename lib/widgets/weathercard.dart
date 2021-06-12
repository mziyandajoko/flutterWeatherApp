import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:madolo_217006168/models/weather_data.dart';
import 'package:provider/provider.dart';

class WeatherCard extends StatelessWidget {
  @override
  const WeatherCard({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    context.read<WeatherData>().fetchData;
    return RefreshIndicator(
      onRefresh: () async {},
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
          child: Consumer<WeatherData>(builder: (context, value, child) {
            return value.map.length == 0 && !value.error
                ? CircularProgressIndicator()
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
          }),
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
    return Container(
      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${map['day']}',
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
                    '${map['wind']}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Image.asset(
                    'assets/images/fair_day.png',
                    height: 25,
                    width: 25,
                  ),
                  Image.asset(
                    'assets/images/fair_night.png',
                    height: 25,
                    width: 25,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    '12\u00b0/7\u00b0',
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

// Future<Map<String,dynamic>>fetchData() async{
//   final response = await get(Uri.parse('https://dl.dropbox.com/s/u1gb9ovxvtaugqj/weather.json?dl=0'));
//   if (response.statusCode == 200){
//     return jsonDecode(response.body);
//   }else{
//     throw Exception('data not found');
//   }
// }
