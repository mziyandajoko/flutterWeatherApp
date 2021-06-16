import 'package:flutter/foundation.dart';
import 'dart:convert';

import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WeatherData with ChangeNotifier {
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';
// set getters
  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response = await get(Uri.parse(
        'https://dl.dropbox.com/s/u1gb9ovxvtaugqj/weather.json?dl=0'));
    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      } catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    } else {
      _error = true;
      _errorMessage = 'Something went wront';
      _map = {};
    }
    notifyListeners();
  }

  void resetValues() {
    _error = false;
    _map = {};
    _errorMessage = '';
    notifyListeners();
  }

  Map<String, dynamic> currentday() {
    var day = DateFormat('EEEE').format(DateTime.now());

    return (_map['Cape Town'] as List<dynamic>).firstWhere(
      (element) => element['day'] == day,
      orElse: () => null,
    );
  }
}
