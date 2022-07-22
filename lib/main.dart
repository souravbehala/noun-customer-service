import 'package:flutter/material.dart';
import 'package:noun_service_app/screens/booking_history_screen.dart';
import 'package:noun_service_app/screens/booking_upcoming_screen.dart';
import 'package:noun_service_app/screens/login_screen.dart';
import 'package:noun_service_app/screens/otp_screen.dart';
import 'package:noun_service_app/screens/slot_booking_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/home_screen.dart';
import 'screens/add_station_screen.dart';
import 'screens/form_screen.dart';
import 'screens/qr_code_screen.dart';
import 'screens/dashboard_screen.dart';
import 'widgets/bottom_navigation_bar.dart';
import 'screens/just_for.dart';
import 'screens/charging_port_screen.dart';
import 'screens/payment_history_screen.dart';
import 'providers/booking_data_container.dart';
import 'providers/charging_port_type_data_container.dart';
import 'providers/user_data_container.dart';
import 'screens/after_slots_remaining_screen.dart';
import './providers/changeAddress.dart';
import './providers/addressProvider.dart';
import './providers/addStation.dart';
import './providers/stationNameList.dart';
import './providers/providerDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isAuth = false;

  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var token = localStorage.getString('token');

    print('Access Token: $token');

    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => BookingDataContainer()),
        ChangeNotifierProvider(create: (ctx) => ChargingPortDataContainer()),
        ChangeNotifierProvider(create: (ctx) => UserDataContainer()),
        ChangeNotifierProvider(create: (ctx) => ChangeLocationProvider()),
        ChangeNotifierProvider(create: (ctx) => LocationProvider()),
        ChangeNotifierProvider(create: (ctx) => AddStation()),
        ChangeNotifierProvider(create: (ctx) => StationNameList()),
        ChangeNotifierProvider(create: (ctx) => ProviderDetails())
      ],
      child: Consumer<UserDataContainer>(
        builder: (ctx, userData, _) => MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: Color(0xff11131b),
            primaryColor: Color(0xff00ffba),
            colorScheme: ColorScheme.fromSwatch().copyWith(
              secondary: const Color(0xff1f1f1f),
              tertiary: const Color(0xff11131b),
            ),
          ),
          // home: LoginScreen(),
          // home: BottomNavigation(),
          home: isAuth ? BottomNavigation() : LoginScreen(),
          routes: {
            AddStationScreen.routeName: (context) => AddStationScreen(),
            // '/form-screen': (context) => FormScreen(),
            // FormScreen.routeName: (context) => FormScreen(),
            BottomNavigation.routeName: (context) => BottomNavigation(),
            // OtpScreen.routeName: (context) => OtpScreen(),
            QRCodeScreen.routeName: (context) => QRCodeScreen(),
            DashboardScreen.routeName: (context) => DashboardScreen(),
            // JustFor.routeName: (context) => JustFor(),
            ChargingPortScreen.routeName: (context) => ChargingPortScreen(),
            SlotBookingScreen.routeName: (context) => SlotBookingScreen(),
            BookingUpcomingScreen.routeName: (context) =>
                BookingUpcomingScreen(),
            BookingHistoryScreen.routeName: (context) => BookingHistoryScreen(),
            PaymentHistoryScreen.routeName: (context) => PaymentHistoryScreen(),
            AfterSlotsRemaining.routeName: (context) => AfterSlotsRemaining(),
          },
        ),
      ),
    );
  }
}
