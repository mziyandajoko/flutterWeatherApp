import 'package:flutter/material.dart';
import 'package:madolo_217006168/models/weather_data.dart';
import 'package:madolo_217006168/widgets/app_label.dart';
import 'package:madolo_217006168/widgets/current_day.dart';
import 'package:madolo_217006168/widgets/topbanner.dart';
import 'package:madolo_217006168/widgets/weathercard.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({
    Key key,
  }) : super(key: key);
  final bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherData(),
      builder: (context, child) {
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
                child: WeatherCard(),
              ),
            ],
          ),
        );
      },
    );
  }
}

// class MainPage extends StatelessWidget {
//   const MainPage({
//     Key key,
//   }) : super(key: key);
//   final bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => WeatherData(),
//         child: Consumer<WeatherData>(
//           builder: (context, value, child) {
//             return Scaffold(
//                 body: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const TopBanner(),
//                 CurrentDayWidget(),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 const AppLabel(),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Expanded(
//                   child: WeatherCard(),
//                 ),
//               ],
//             ));
//           },
//         ));
//   }
// }
