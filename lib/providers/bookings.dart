import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../utilities/config.dart';

class Bookings with ChangeNotifier {
  Map<String, dynamic> _bookings = {};
  Map<String, dynamic> _bookingDetails = {};

  Map<String, dynamic> get bookings {
    return {..._bookings};
  }

  Map<String, dynamic> get bookingsDetails {
    return {..._bookingDetails};
  }

  Future<void> getBookings() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response =
        await http.get(Uri.parse('$baseURL/station/booking'), headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    if (response.statusCode == 200) {
      _bookings = json.decode(response.body);
    } else {
      _bookings = {};
    }

    print('Bookings: $_bookings');
  }

  Future<Map<String, dynamic>> getBookingDetails(int id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response =
        await http.get(Uri.parse('$baseURL/station/booking/$id'), headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      _bookingDetails = json.decode(response.body);
    } else {
      _bookingDetails = {};
    }

    print('Booking Details: $_bookingDetails');

    return _bookingDetails;
  }
}
