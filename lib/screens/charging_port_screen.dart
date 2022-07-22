import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../widgets/app_bar.dart';
import '../models/charging_port.dart';
import '../widgets/charging_port_bar.dart';

class ChargingPortScreen extends StatefulWidget {
  static const routeName = 'charging_port_screen';

  @override
  State<ChargingPortScreen> createState() => _ChargingPortScreenState();
}

class _ChargingPortScreenState extends State<ChargingPortScreen> {
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
          Text('Add charging port type'),
          SizedBox(
            height: mediaQuery.height * 0.05,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ChargingPortBar(title: _chargingPortList[index].title);
              },
              itemCount: _chargingPortList.length,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _startAddNewChargingPort(context),
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
