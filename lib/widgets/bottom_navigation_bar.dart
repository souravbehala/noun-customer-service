import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../screens/home_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/booking_history_screen.dart';
import '../screens/payment_history_screen.dart';
import '../screens/booking_upcoming_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/just_for.dart';
import '../providers/stationNameList.dart';
import '../providers/providerDetails.dart';

class BottomNavigation extends StatefulWidget {
  static const routeName = 'bottom_navigation_bar';
  BottomNavigationState createState() => BottomNavigationState();
}

class BottomNavigationState extends State<BottomNavigation> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<StationNameList>(context, listen: false)
        .getStationNames()
        .then((_) {
      Provider.of<ProviderDetails>(context, listen: false)
          .getProviderDetails()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    });
    super.initState();
  }

  final bool pointer = false;
  int index = 2;

  final screens = [
    NotificationsScreen(),
    BookingHistoryScreen(),
    HomeScreen(),
    DashboardScreen(),
    PaymentHistoryScreen(),
    // JustFor(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final items = [
      Image.asset(
        'assets/images/noti.png',
        width: index == 0 ? width * 0.15 : width * 0.7,
        height: index == 0 ? height * 0.04 : height * 0.2,
        color: index == 0 ? Theme.of(context).primaryColor : Colors.white,
      ),
      Image.asset(
        'assets/images/reserved.png',
        width: index == 1 ? width * 0.15 : width * 0.7,
        height: index == 1 ? height * 0.04 : height * 0.2,
        color: index == 1 ? Theme.of(context).primaryColor : Colors.white,
      ),
      Image.asset(
        'assets/images/home.png',
        width: index == 2 ? width * 0.15 : width * 0.07,
        height: index == 2 ? height * 0.04 : height * 0.2,
        color: index == 2 ? Theme.of(context).primaryColor : Colors.white,
      ),
      Image.asset(
        'assets/images/calender.png',
        width: index == 3 ? width * 0.15 : width * 0.7,
        height: index == 3 ? height * 0.04 : height * 0.2,
        color: index == 3 ? Theme.of(context).primaryColor : Colors.white,
      ),
      Image.asset(
        'assets/images/payment2.png',
        width: index == 4 ? width * 0.15 : width * 0.7,
        height: index == 4 ? height * 0.04 : height * 0.2,
        color: index == 4 ? Theme.of(context).primaryColor : Colors.white,
      ),
    ];

    // TODO: implement build
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : screens[index],
      extendBody: true,
      bottomNavigationBar: Container(
        // padding: EdgeInsets.only(top: ),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Theme.of(context).primaryColor,
              // spreadRadius: 1,
              blurRadius: 5, //change done
              offset: Offset(0, 0))
        ]),
        child: CurvedNavigationBar(
          items: items,
          index: index,
          height: 60,
          color: Theme.of(context).colorScheme.secondary,
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Theme.of(context).colorScheme.secondary,
          onTap: (index) => setState(() {
            this.index = index;
            // HomeScreen(index);
            // Navigator.of(context)
            //     .pushNamed('/home-screen', arguments: this.index);
          }),
        ),
      ),
    );
  }
}
