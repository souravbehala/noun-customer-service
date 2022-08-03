import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/station/stationPort.dart';
import '../widgets/app_bar.dart';
import '../models/charging_port.dart';
import '../widgets/charging_port_bar.dart';
import 'dart:convert';

class ChargingPortScreen extends StatefulWidget {
  static const routeName = 'charging_port_screen';

  ChargingPortScreenState createState() => ChargingPortScreenState();
}

class ChargingPortScreenState extends State<ChargingPortScreen> {
  //const ChargingPortScreen({Key? key}) : super(key: key);
  bool isLoading = true;
  var selectedItem;

  final chargingPortTypeController = TextEditingController();

  final priceController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<StationPort>(context, listen: false).getPortDetails().then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final portType = Provider.of<StationPort>(context).portTypes;
    final portData = Provider.of<StationPort>(context).portDetails;

    return Scaffold(
      appBar: MyAppBar('Charging Port', true),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Column(
              children: [
                const Text('Add charging port type'),
                SizedBox(
                  height: mediaQuery.height * 0.05,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return ChargingPortBar(
                          title: portData['data'][index]['fldStationPortName']);
                    },
                    itemCount: portData['data'].length,
                  ),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _startAddNewChargingPort(context, portType['data']),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }

  void _startAddNewChargingPort(BuildContext ctx, List<dynamic> ports) {
    showModalBottomSheet(
      context: ctx,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setState) => Container(
            // height: MediaQuery.of(ctx).size.height * 0.4,
            padding: EdgeInsets.only(
              top: 10,
              left: 10,
              right: 10,
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 10,
            ),
            child: ListView(
              children: [
                DropdownButtonHideUnderline(
                    child: DropdownButton(
                        value: selectedItem,
                        hint: const Text(
                          'Select Port Type',
                          style: TextStyle(color: Colors.white),
                        ),
                        items: ports
                            .map((item) => DropdownMenuItem(
                                  child: Text(item['portName']),
                                  value: item['portKey'].toString(),
                                ))
                            .toList(),
                        onChanged: (item) {
                          setState(() {
                            selectedItem = item;
                          });
                        })),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Charging Port Name'),
                  controller: chargingPortTypeController,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: const InputDecoration(labelText: 'Price'),
                  controller: priceController,
                ),
                const SizedBox(
                  height: 70,
                ),
                TextButton(
                  onPressed: () async {
                    var response =
                        await Provider.of<StationPort>(context, listen: false)
                            .postPort(
                                int.parse(selectedItem),
                                chargingPortTypeController.text,
                                int.parse(priceController.text));

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        response['message'],
                        style: const TextStyle(color: Colors.white),
                      ),
                      action: SnackBarAction(
                          label: 'OK',
                          textColor: Colors.green,
                          onPressed: () => Navigator.of(context).pop()),
                    ));
                    // .then((_) {
                    Navigator.of(context).pop();

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ChargingPortScreen()));

                    // setState(() {
                    //   Provider.of<StationPort>(context, listen: false)
                    //       .getPortDetails();
                    // });

                    // });
                  },
                  child: const Text(
                    'ADD',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15.0, horizontal: 150.0),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
