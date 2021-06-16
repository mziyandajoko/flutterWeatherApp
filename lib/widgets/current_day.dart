import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:madolo_217006168/models/weather_data.dart';
import 'package:provider/provider.dart';

class CurrentDayWidget extends StatelessWidget {
  @override
  const CurrentDayWidget({Key key}) : super(key: key);

  Widget build(BuildContext context) {
    context.read<WeatherData>().fetchData;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        child: Consumer<WeatherData>(
          builder: (context, value, child) {
            return value.map.length == 0 && !value.error
                ? Container()
                : value.error
                    ? Text(
                        'Something went wrong while fetcjing Data. ${value.error}')
                    : CurrentDay();
          },
        ),
      ),
    );
  }
}

class CurrentDay extends StatelessWidget {
  const CurrentDay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            child: Consumer<WeatherData>(
              builder: (context, value, child) {
                var data = value.currentday();
                return value.map.length == 0 && !value.error
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [CircularProgressIndicator()])
                    : Padding(
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
                                  '${data['maxtemp']}\u00b0',
                                  style: TextStyle(fontSize: 70),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${data['condition_day']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${data['maxtemp']}\u00b0/${data['mintemp']}\u00b0',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '${data['maxtemp']}kph wind',
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
            )));
  }
}

// class CurrentDayWidget extends StatelessWidget {
//   const CurrentDayWidget({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<WeatherData>(
//       builder: (context, value, child) {
//         var data = value.currentday();
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
//                   Text(
//                     '${data['maxtemp']}\u00b0',
//                     style: TextStyle(fontSize: 70),
//                   ),
//                 ],
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Text(
//                     '${data['condition_day']}',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '${data['maxtemp']}\u00b0/${data['mintemp']}\u00b0',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     '${data['maxtemp']}kph wind',
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
