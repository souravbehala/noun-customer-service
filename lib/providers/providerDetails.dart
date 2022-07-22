import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderDetails with ChangeNotifier {
  Map<String, dynamic> _providerDetails = {};

  Map<String, dynamic> get providerDetails {
    return {..._providerDetails};
  }

  Future<void> getProviderDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response = await http
        .get(Uri.parse('$baseURL/station/provider/details'), headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    if (response.statusCode == 200) {
      _providerDetails = json.decode(response.body);

      print('Provider Details: $_providerDetails');
    } else {
      _providerDetails = {};
    }
  }
}
