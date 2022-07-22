import 'package:flutter/material.dart';
import '../models/charging_port.dart';

class ChargingPortDataContainer with ChangeNotifier {
  List<ChargingPort> _portTypes = [
    ChargingPort(title: 'All', price: 1),
    ChargingPort(title: 'CCS', price: 2),
    ChargingPort(title: 'Chadmeo', price: 3),
  ];

  List<ChargingPort> get portTypes {
    return [..._portTypes];
  }
}
