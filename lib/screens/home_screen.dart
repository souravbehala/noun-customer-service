import 'package:flutter/material.dart';
import 'package:noun_service_app/providers/station/satationDetails.dart';
import 'package:noun_service_app/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'station_screen.dart';
import 'station_details.dart';
import 'about_screen.dart';
import '../widgets/dropdown_widget.dart';
import '../providers/stationNameList.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  //TabBarScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool? tokenRole;
  bool isLoading = true;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   roleToken();
  //   super.initState();
  // }

  // void roleToken() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   tokenRole = localStorage.getBool('role');
  //   print('Token Roleeeeeeeeeee: $tokenRole');
  // }

  @override
  void initState() {
    // TODO: implement initState
    getRole().then((_) {
      setState(() {
        isLoading = false;
      });
    });
    // print('Token Role; $tokenRole');
    // print('GET ROLE: ${getRole()}');
    super.initState();
  }

  Future<void> getRole() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    setState(() {
      tokenRole = localStorage.getBool('boolValue');
    });
    print('TOKEN ROLE: $tokenRole');
  }

  @override
  Widget build(BuildContext context) {
    final stationDetailsProvider =
        Provider.of<StationNameList>(context).stationDetails;
    final stationManagerProvider =
        Provider.of<StationDetails>(context).stationManagerDetails;

    return DefaultTabController(
      length: 3,
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.tertiary,
                automaticallyImplyLeading: false,
                actions: [
                  InkWell(
                      onTap: () async {
                        SharedPreferences localStorage =
                            await SharedPreferences.getInstance();
                        localStorage.remove('token');
                        localStorage.remove('role');
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: Icon(Icons.power_off, color: Colors.white))
                ],
                elevation: 0,
                title: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 17,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    // Text(
                    //   'Salt Lake',
                    //   style: TextStyle(fontSize: 15),
                    // ),
                    // DropdownWidget(dataList: ['Salt Lake', 'Kudghat']),
                    tokenRole == false
                        ? Text(stationManagerProvider['data']['stationName'],
                            style: const TextStyle(color: Colors.white))
                        // Text('OLD TRAFFORD',
                        //     style: const TextStyle(color: Colors.white))
                        : Provider.of<StationNameList>(context).stationList ==
                                {}
                            ? const Text(
                                'No Stations Added',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 13),
                              )
                            : DropdownWidget(
                                Provider.of<StationNameList>(context)
                                    .stationList['data'])
                  ],
                ),
                bottom: TabBar(
                    indicatorColor: Theme.of(context).primaryColor,
                    tabs: [
                      Tab(text: 'Station'),
                      Tab(text: 'Station Details'),
                      Tab(text: 'About'),
                    ]),
              ),
              body: TabBarView(children: [
                StationScreen(),
                StationDetailsScreen(tokenRole == false
                    ? stationManagerProvider
                    : stationDetailsProvider),
                AboutScreen(),
              ]),
            ),
    );
  }
}
