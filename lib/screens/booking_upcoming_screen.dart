import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/booking_list_item.dart';

import '../providers/booking_data_container.dart';
import '../providers/charging_port_type_data_container.dart';

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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Theme.of(context).colorScheme.secondary,
              ),
              width: mediaQuery.width * 0.5,
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    isExpanded: true,
                    value: _selectedItem,
                    items: portTypeList
                        .map((item) =>
                            DropdownMenuItem(value: item, child: Text(item)))
                        .toList(),
                    onChanged: (item) {
                      setState(
                        () {
                          _selectedItem = item as String;
                          // _filterBookingList(item);
                        },
                      );
                      _filterBookingList(_selectedItem);
                    }),
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  // return BookingListItem();
                  return BookingListItem(
                    bookingDate: bookings[index].bookingDate,
                    bookingPower: bookings[index].bookingPower,
                    bookingPrice: bookings[index].bookingPrice,
                    bookingTime: bookings[index].bookingTime,
                    carBrand: bookings[index].carBrand,
                    carImg: bookings[index].carImg,
                    carType: bookings[index].carType,
                    portType: bookings[index].portType,
                  );
                },
                itemCount: bookings.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
