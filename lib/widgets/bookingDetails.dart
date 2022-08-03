import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class BookingDetailsWindow extends StatefulWidget {
  final int bookingKey;

  BookingDetailsWindow(this.bookingKey);

  BookingDetailsWindowState createState() => BookingDetailsWindowState();
}

class BookingDetailsWindowState extends State<BookingDetailsWindow> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      title: Text('Booking Details'),
    );
  }
}
