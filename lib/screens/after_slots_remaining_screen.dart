import 'package:flutter/material.dart';
import 'package:noun_service_app/screens/slot_booking_screen.dart';
import '../widgets/app_bar.dart';
import '../models/charging_port.dart';
import '../widgets/charging_port_bar.dart';
import 'package:provider/provider.dart';
import '../providers/station/stationPort.dart';

class AfterSlotsRemaining extends StatefulWidget {
  static const routeName = 'after_slots_remaining';

  @override
  State<AfterSlotsRemaining> createState() => _AfterSlotsRemainingState();
}

class _AfterSlotsRemainingState extends State<AfterSlotsRemaining> {
  // bool isLoading = true;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   Provider.of<StationPort>(context, listen: false).getPortDetails().then((_) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final portTypes = Provider.of<StationPort>(context).portDetails;

    return Scaffold(
        appBar: MyAppBar('Charging Port', true),
        body:
            // isLoading
            //     ? const Center(
            //         child: CircularProgressIndicator(
            //           color: Colors.green,
            //         ),
            //       )
            //     :
            Column(
          children: [
            const Text('Select the port types to see the slots remaining'),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, SlotBookingScreen.routeName),
                      child: ChargingPortBar(
                        // title: _chargingPortList[index].title
                        title: portTypes['data'][index]['fldStationPortName'],
                      ));
                },
                itemCount: portTypes['data'].length,
              ),
            ),
          ],
        ));
  }
}
