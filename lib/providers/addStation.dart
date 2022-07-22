import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../utilities/config.dart';

class AddStation with ChangeNotifier {
  Map<String, dynamic> _station = {};

  Map<String, dynamic> get station {
    return {..._station};
  }

  Future<Map<String, dynamic>> postStation(
      String providerName,
      String providerEmail,
      String providerContactNumber,
      String stationName,
      String stationLicenseNumber,
      String stationContactNumber,
      List<dynamic> options,
      int level2,
      int level3,
      String address,
      double latitude,
      double longitude) async {
    var data = {
      "name": providerName,
      "phone": providerContactNumber,
      "email": providerEmail,
      "stationName": stationName,
      "licenseNumber": stationLicenseNumber,
      "contactNumber": stationContactNumber,
      "stationAdress": address,
      "stationMapLat": latitude.toString(),
      // "stationMapLat": "876.345",
      "stationMapLng": longitude.toString(),
      // "stationMapLng": "43.443",
      // "powerTypeIsAc": "AC",
      "powerTypeIsAc": options[0]['value'] == true ? "AC" : "NA",
      // "powerTypeIsDc": "DC",
      "powerTypeIsDc": options[1]['value'] == true ? "DC" : "NA",
      // "IsCafeAvailable": "1",
      "IsCafeAvailable": level2.toString(),
      "IsParkAvailable": level3.toString()
      // "IsParkAvailable": "0"
    };

    print('API CALLED');
    print('DATA: $data');
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var response = await http.post(
        Uri.parse('$baseURL/station/provider/add-station'),
        body: json.encode(
            // "name": providerName,
            // "phone": providerContactNumber,
            // "email": providerEmail,
            // "stationName": stationName,
            // "licenseNumber": stationLicenseNumber,
            // "contactNumber": stationContactNumber,
            // "stationAdress": address,
            // "stationMapLat": latitude.toString(),
            // "stationMapLng": longitude.toString(),
            // "powerTypeIsAc": options[0]['value'] == true ? "AC" : "",
            // "powerTypeIsDc": options[1]['value'] == true ? "DC" : "",
            // "IsCafeAvailable": level2.toString(),
            // "IsParkAvailable": level3.toString()
            data),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        });

    var res = json.decode(response.body);

    print('RESPONSE: $res');

    return res;
  }
}
