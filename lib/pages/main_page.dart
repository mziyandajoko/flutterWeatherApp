
import 'package:flutter/material.dart';
import 'package:madolo_217006168/widgets/app_label.dart';
import 'package:madolo_217006168/widgets/current_day.dart';
import 'package:madolo_217006168/widgets/topbanner.dart';
import 'package:madolo_217006168/widgets/weathercard.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const TopBanner(),
          CurrentDayWidget(),
          SizedBox(
            height: 10,
          ),
          const AppLabel(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 7,
              itemBuilder: (context, index) {
                return WeatherCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
