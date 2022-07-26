import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/config.dart';
import 'dart:convert';

class StationDetails with ChangeNotifier {
  Map<String, dynamic> _stationDetails = {};

  Map<String, dynamic> get stationManagerDetails {
    return {..._stationDetails};
  }

  Future<void> getStationDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response =
        await http.get(Uri.parse('$baseURL/station/station-details'), headers: {
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    if (response.statusCode == 200) {
      _stationDetails = json.decode(response.body);
      print('DETAIIIILSSSSSSSSSSSSS');
    } else {
      _stationDetails = {};
    }

    print('Stations Details: $_stationDetails');
  }
}
