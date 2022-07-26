import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/config.dart';

class StationPort with ChangeNotifier {
  Map<String, dynamic> _portDetails = {};

  Map<String, dynamic> get portDetails {
    return {..._portDetails};
  }

  Future<void> getPortDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response =
        await http.get(Uri.parse('$baseURL/station/ports'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}',
    });

    if (response.statusCode == 200) {
      _portDetails = json.decode(response.body);
    } else {
      _portDetails = {};
    }

    print('Port Details: $_portDetails');
  }

  Future<Map<String, dynamic>> postPort() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response = await http.post(Uri.parse('$baseURL/station/ports'),
        body: json
            .encode({'chargingPortKey': '', 'portName': '', 'portPrice': 0}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        });

    return json.decode(response.body);
  }
}
