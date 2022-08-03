import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/booking_list_item.dart';
import '../providers/station/stationPort.dart';
import '../providers/booking_data_container.dart';
import '../providers/charging_port_type_data_container.dart';
import '../providers/bookings.dart';
import 'package:intl/intl.dart';
import '../widgets/bookingDetails.dart';

class BookingUpcomingScreen extends StatefulWidget {
  //const BookingScreen({Key? key}) : super(key: key);
  static const routeName = 'booking_upcoming_screen';

  @override
  State<BookingUpcomingScreen> createState() => _BookingUpcomingScreenState();
}

class _BookingUpcomingScreenState extends State<BookingUpcomingScreen> {
  List _chargingPortTypes = ['All', 'CCS', 'Chadmeo'];
  var _selectedItem = 'All';
  var bookings = [];
  var bookingsCopy = [];
  DateFormat dateFormat = DateFormat('dd-MMM-yyyy');
  DateFormat dateTime = DateFormat('HH:mm:ss');

  // @override
  // void initState() {
  //  _selectedItem = ''
  //   super.initState();
  // }
  // void _filterBookingList(String query) {
  //   final filteredBookingList = bookings.where((item) {
  //     final portType = item.portType.toLowerCase();
  //     final input = query.toLowerCase();

  //     return portType.contains(input);
  //   }).toList();

  //   setState(() {
  //     bookings = filteredBookingList;
  //   });
  // }
  @override
  void initState() {
    final bookingData =
        Provider.of<BookingDataContainer>(context, listen: false);

    bookings = bookingData.bookings;
    bookingsCopy = bookingData.bookings;
    super.initState();
  }

  void _filterBookingList(String query) {
    print(query);
    bookings = bookingsCopy;
    if (query == 'All') {
      setState(() {
        bookings = bookingsCopy;
      });
      return;
    }
    final filteredList = bookings.where((item) {
      final portType = item.portType.toLowerCase();
      final input = query.toLowerCase();

      return portType.contains(input);
    }).toList();
    //bookings = Provider.of<BookingDataContainer>(context, listen: false).bookings;
    setState(() {
      bookings = filteredList;
    });
    print('filterdList: $filteredList');
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final ports = Provider.of<StationPort>(context).portTypes;
    final booking = Provider.of<Bookings>(context).bookings;
    // final bookingData = Provider.of<BookingDataContainer>(context);
    // bookings = bookingData.bookings;
    final portTypeData = Provider.of<ChargingPortDataContainer>(context);
    final portTypes = portTypeData.portTypes; //this the portype list
    var portTypeList = [];

    for (var item in portTypes) {
      //adding the portType titles to a new list
      portTypeList.add(item.title);
      print(portTypeList);
    }

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: Text('Upcoming Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Container(
            //   padding: EdgeInsets.symmetric(horizontal: 5.0),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(12),
            //     color: Theme.of(context).colorScheme.secondary,
            //   ),
            //   width: mediaQuery.width * 0.5,
            //   child: DropdownButtonHideUnderline(
            //     child: DropdownButton(
            //         isExpanded: true,
            //         value: _selectedItem,
            //         items: ports['data']
            //             .map((item) => DropdownMenuItem(
            //                 value: item['fldStationPortName'],
            //                 child: Text(item['fldStationPortName'])))
            //             .toList(),
            //         onChanged: (item) {
            //           setState(
            //             () {
            //               _selectedItem = item as String;
            //               // _filterBookingList(item);
            //             },
            //           );
            //           _filterBookingList(_selectedItem);
            //         }),
            //   ),
            // ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  // return BookingListItem();
                  return InkWell(
                    onTap: () async {
                      var response =
                          await Provider.of<Bookings>(context, listen: false)
                              .getBookingDetails(
                                  booking['data'][index]['bookingKey']);
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                content: Column(
                                  children: [
                                    Row(
                                      children: [
                                        const Text('Status: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['status'],
                                          style: const TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Booking Date: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          dateFormat
                                              .format(DateTime.parse(
                                                      response['data']
                                                          ['bookingDate'])
                                                  .toLocal())
                                              .toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Port Name: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['portName'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Text('Slots Booked: ',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    for (var counter = 0;
                                        counter <
                                            response['data']['slotList'].length;
                                        counter++)
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            // color: Colors.red,
                                            width: double.infinity,
                                            child: Expanded(
                                              child: Text(
                                                '${response['data']['slotList'][counter]['slotStartTime']}-${response['data']['slotList'][counter]['slotEndTime']},',
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Port Type: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['portType'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Customer Name: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['customerName'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Customer Phone: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['customerPhone'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Car Brand: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['carBrand'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Car Model: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['carModel'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Car Sub Model: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['carSubModel'],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Image.network(response['data']['carImage']),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Discount: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['totalDiscount'] ==
                                                  null
                                              ? 'NA'
                                              : '₹${response['data']['totalDiscount']}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: mediaQuery.height * 0.01),
                                    Row(
                                      children: [
                                        const Text('Price: ',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        Text(
                                          response['data']['price'] == null
                                              ? 'NA'
                                              : '₹${response['data']['price']}',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ));
                    },
                    child: BookingListItem(
                      bookingDate: dateFormat
                          .format(DateTime.parse(
                                  booking['data'][index]['bookingDate'])
                              .toLocal())
                          .toString(),
                      // bookings[index].bookingDate,
                      // bookingPower: bookings[index].bookingPower,
                      bookingPrice: booking['data'][index]['price'].toString(),
                      bookingTime: dateTime
                          .format(DateTime.parse(
                                  booking['data'][index]['bookingDate'])
                              .toLocal())
                          .toString(),
                      // carBrand: bookings[index].carBrand,
                      // carImg: bookings[index].carImg,
                      // carType: bookings[index].carType,
                      portType: booking['data'][index]['portType'],
                    ),
                  );
                },
                itemCount: booking['data'].length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
