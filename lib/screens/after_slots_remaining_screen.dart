import 'package:flutter/material.dart';
import 'package:noun_service_app/screens/slot_booking_screen.dart';
import 'package:path/path.dart';

import '../widgets/app_bar.dart';
import '../models/charging_port.dart';
import '../widgets/charging_port_bar.dart';

class AfterSlotsRemaining extends StatefulWidget {
  static const routeName = 'after_slots_remaining';

  @override
  State<AfterSlotsRemaining> createState() => _AfterSlotsRemainingState();
}

class _AfterSlotsRemainingState extends State<AfterSlotsRemaining> {
  //const ChargingPortScreen({Key? key}) : super(key: key);
  final List<ChargingPort> _chargingPortList = [
    ChargingPort(title: 'CCS', price: 123),
    ChargingPort(title: 'CHAdeMO', price: 123),
    ChargingPort(title: 'J1772', price: 123),
    ChargingPort(title: 'GB/T', price: 123),
  ];

  final chargingPortTypeController = TextEditingController();

  final priceController = TextEditingController();

  void _addNewChargingPort(String title, double price, BuildContext ctx) {
    final newChargingPort = ChargingPort(title: title, price: price);
    setState(() {
      _chargingPortList.add(newChargingPort);
      chargingPortTypeController.text = '';
      priceController.text = '';
    });
    Navigator.pop(ctx);
  }

  void _startAddNewChargingPort(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return Container(
          // height: MediaQuery.of(ctx).size.height * 0.4,
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 10,
          ),
          child: ListView(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Charging port type'),
                controller: chargingPortTypeController,
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Price'),
                controller: priceController,
              ),
              SizedBox(
                height: 70,
              ),
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text('ADD'),
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              //   ),
              // )
              TextButton(
                onPressed: () => _addNewChargingPort(
                    chargingPortTypeController.text,
                    double.parse(priceController.text),
                    ctx),
                child: Text(
                  'ADD',
                  style: TextStyle(color: Colors.white),
                ),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 150.0),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar('Charging Port', true),
      body: Column(
        children: [
          Text('Select the port types to see the slots remaining'),
          SizedBox(
            height: mediaQuery.height * 0.05,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Navigator.pushNamed(
                        context, SlotBookingScreen.routeName),
                    child:
                        ChargingPortBar(title: _chargingPortList[index].title));
              },
              itemCount: _chargingPortList.length,
            ),
          ),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   onPressed: () => _startAddNewChargingPort(context),
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.black,
      //   ),
      // ),
    );
  }
}
