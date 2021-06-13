import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:madolo_217006168/models/weather_data.dart';

// class CurrentDayWidget extends StatelessWidget {
//   final Map<String, dynamic> map;
//   const CurrentDayWidget({Key key, @required this.map}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     context.read<WeatherData>().fetchData;
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 Container(
//                   height: 110,
//                   width: 110,
//                   child: Image.asset('assets/images/rain.png'),
//                 ),
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   '${map['maxtemp']}\u00b0',
//                   style: TextStyle(fontSize: 70),
//                 ),
//               ],
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 Text(
//                   'Fair',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   '${map['maxtemp']}\u00b0/${map['mintemp']}\u00b0',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   '${map['humidity']}kph wind',
//                   // '12kph wind',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),

//       ),
//     );
//   }
// }
// int.parse(DateFormat('H').format(DateTime.now()));
class CurrentDayWidget extends StatelessWidget {
  CurrentDayWidget({
    Key key,
  }) : super(key: key);
  // if (DateFormat('EEEE').format(DateTime.now()) == '${map['day']}')

  @override
  Widget build(BuildContext context) {
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
              if (int.parse(DateFormat('H').format(DateTime.now())) != 06)
                Container(
                  height: 110,
                  width: 110,
                  child: Image.asset('assets/images/rain.png'),
                ),
              if (int.parse(DateFormat('H').format(DateTime.now())) > 18)
                Container(
                  height: 110,
                  width: 110,
                  child: Image.asset('assets/images/cloudy_night.png'),
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
  }
}
