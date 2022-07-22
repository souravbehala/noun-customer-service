import 'package:flutter/material.dart';
// import 'package:noun_customer_app/screens/booking_details_screen.dart';
import '../utilities/constants.dart';
// import '../widgets/slot_widget.dart';
// import 'booking_screen.dart';

class SlotBookingScreen extends StatefulWidget {
  //SlotBookingScreen({Key? key}) : super(key: key);
  static const routeName = 'slot_booking';
  // final isPressed;
  // SlotBookingScreen(this.isPressed);

  @override
  State<SlotBookingScreen> createState() => _SlotBookingScreenState();
}

class _SlotBookingScreenState extends State<SlotBookingScreen> {
  var _isSlotSelected = false;
  // bool status = false;
  List _selectedSlotList = [];

  @override
  void initState() {
    for (var item in kSlots) {
      item['clicked'] = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kScaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)),
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: kScaffoldBackgroundColor,
        title: Text('Slot Booking'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: GridView.builder(
                itemCount: kSlots.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 0,
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 1),
                itemBuilder: (context, index) => Container(
                      decoration: BoxDecoration(
                          // color: Colors.amber,
                          border: Border(
                        bottom: BorderSide(
                            width: .5, color: Theme.of(context).primaryColor),
                      )),
                      padding: EdgeInsets.all(5.0),
                      // height: MediaQuery.of(context).size.height * 0.1,
                      child: ElevatedButton(
                        // id: kSlots[index]['id'],
                        style: ElevatedButton.styleFrom(
                            primary: Theme.of(context).colorScheme.secondary,
                            elevation: 20.0,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 4.0)),
                        onPressed: () {
                          setState(() {
                            kSlots[index]['clicked'] =
                                kSlots[index]['clicked'] == true ? false : true;
                            _isSlotSelected = true;
                            // _isSlotSelected = !kSlots[index]['clicked'];
                          });
                          _selectedSlotList
                              .add(kSlots[index]); //adding the selected slot
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Time',
                                  style: (kSlots[index]['clicked'] == true)
                                      ? TextStyle(color: Colors.grey)
                                      : TextStyle(color: Colors.white),
                                ),
                                SizedBox(height: 10.0),
                                Flexible(
                                  fit: FlexFit.loose,
                                  child: Container(
                                    width: 50.0,
                                    child: FittedBox(
                                      fit: BoxFit.fill,
                                      child: Text(
                                        kSlots[index]['time'].toString(),
                                        style: (kSlots[index]['clicked'] ==
                                                true)
                                            ? TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.bold)
                                            : TextStyle(
                                                fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 30.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Slot ${kSlots[index]['slotNumber']}',
                                    style: (kSlots[index]['clicked'] == true)
                                        ? TextStyle(color: Colors.grey)
                                        : TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                (kSlots[index]['clicked'] == true)
                                    ? Flexible(
                                        fit: FlexFit.loose,
                                        child: Image.asset(
                                          'assets/images/carred.png',
                                          width: 80.0,
                                          height: 50.0,
                                        ),
                                      )
                                    : Flexible(
                                        fit: FlexFit.loose,
                                        child: Image.asset(
                                          'assets/images/cargreen.png',
                                          width: 80.0,
                                          height: 50.0,
                                        ),
                                      )
                              ],
                            )
                          ],
                        ),
                      ),
                    )),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.8,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              color: Colors.grey[850],
              child: ElevatedButton(
                onPressed: _isSlotSelected == true
                    ? () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) => BookingDetails(
                        //             date: '9/5/22',
                        //             stationName: 'Lightning Bolt Station',
                        //             time: '9:40 AM',
                        //             power: '40KmH',
                        //             selectedSlotList: _selectedSlotList,
                        //           )),
                        // );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  onSurface: Colors.grey[850],
                  primary: Theme.of(context).primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                ),
                child: Text(
                  'CONTINUE',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: (_isSlotSelected == true)
                          ? Colors.black
                          : Colors.white54,
                      fontSize: 15.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
