import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:madolo_217006168/models/weather_data.dart';

class CurrentDayWidget extends StatelessWidget {
  CurrentDayWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<WeatherData>().fetchData;
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
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
                        return CurrentDayContent(
                          map: value.map['Cape Town'][index],
                        );
                      },
                    );
        }),
      ),
    );
  }
}

class CurrentDayContent extends StatelessWidget {
  final Map<String, dynamic> map;
  const CurrentDayContent({Key key, @required this.map}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
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
              '${map['maxtemp']}\u00b0',
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
              '${map['maxtemp']}\u00b0/${map['mintemp']}\u00b0',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${map['humidity']}kph wind',
              // '12kph wind',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
