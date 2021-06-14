import 'package:flutter/material.dart';
import 'package:madolo_217006168/models/weather_data.dart';
import 'package:provider/provider.dart';

class CurrentDayWidget extends StatelessWidget {
  CurrentDayWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherData>(
      builder: (context, value, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 110,
                    width: 110,
                    child: Image.asset('assets/images/rain.png'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    '12\u00b0',
                    style: TextStyle(fontSize: 70),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Fair',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '12\u00b0/7\u00b0',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '12kph wind',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:madolo_217006168/models/weather_data.dart';
// import 'package:provider/provider.dart';

// class CurrentDayWidget extends StatelessWidget {
//   @override
//   const CurrentDayWidget({Key key}) : super(key: key);

//   Widget build(BuildContext context) {
//     context.read<WeatherData>().fetchData;
//     return Container(
//         child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
//             child: Consumer<WeatherData>(
//               builder: (context, value, child) {
//                 return CurrentDay(
//                   map: value.map['Cape Town'],
//                 );
//               },
//             )));
//   }
// }

// // class CurrentDay extends StatelessWidget {
//   // CurrentDayWidget({
//   //   Key key,
//   // }) : super(key: key);
//   final Map<String, dynamic> map;
//   const CurrentDay({Key key, @required this.map}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     context.read<WeatherData>().fetchData;

//     return Consumer<WeatherData>(
//       builder: (context, value, child) {
//         print(map);
//         return Padding(
//           padding: const EdgeInsets.symmetric(
//             horizontal: 20.0,
//             vertical: 8.0,
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Row(
//                 children: [
//                   Container(
//                     height: 110,
//                     width: 110,
//                     child: Image.asset('assets/images/rain.png'),
//                   ),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   if (DateFormat('EEEE').format(DateTime.now()) ==
//                       '${map['day']}')
//                     Text(
//                       '${map['humidity']}\u00b0',
//                       style: TextStyle(fontSize: 70),
//                     ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     'Fair',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '12\u00b0/7\u00b0',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '12kph wind',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
