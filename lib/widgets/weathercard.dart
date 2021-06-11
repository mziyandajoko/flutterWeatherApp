import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WeatherCard extends StatefulWidget {
  const WeatherCard({Key key}) : super(key: key);

  @override
  _WeatherCardState createState() => _WeatherCardState();
}

class _WeatherCardState extends State<WeatherCard>   {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: Card(
          color: Colors.white,
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Monday',
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
                      '20%',
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
      ),
    );
  }
}

Future<Map<String,dynamic>>fetchData() async{
  final response = await get(Uri.parse('https://dl.dropbox.com/s/u1gb9ovxvtaugqj/weather.json?dl=0'));
  if (response.statusCode == 200){
    return jsonDecode(response.body);
  }else{
    throw Exception('data not found'); 
  }
}