import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StationNameList with ChangeNotifier {
  Map<String, dynamic> _stationList = {};

  Map<String, dynamic> get stationList {
    return {..._stationList};
  }

  Future<void> getStationNames() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response = await http
        .get(Uri.parse('$baseURL/station/provider/stations'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    if (response.statusCode == 200 || response.statusCode == 201) {
      _stationList = json.decode(response.body);
      print('Station List');
    } else {
      _stationList = {'data': []};
    }
    print('Station List $_stationList');
  }
}
