import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'station_screen.dart';
import 'station_details.dart';
import 'about_screen.dart';
import '../widgets/dropdown_widget.dart';
import '../providers/stationNameList.dart';

class HomeScreen extends StatefulWidget {
  //TabBarScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          automaticallyImplyLeading: false,
          elevation: 0,
          title: Row(
            children: [
              Icon(
                Icons.location_on,
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              // Text(
              //   'Salt Lake',
              //   style: TextStyle(fontSize: 15),
              // ),
              // DropdownWidget(dataList: ['Salt Lake', 'Kudghat']),
              Provider.of<StationNameList>(context)
                          .stationList['data']
                          .length ==
                      0
                  ? const Text(
                      'No Stations Added',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    )
                  : DropdownWidget(
                      Provider.of<StationNameList>(context).stationList['data'])
            ],
          ),
          bottom: TabBar(indicatorColor: Theme.of(context).primaryColor, tabs: [
            Tab(text: 'Station'),
            Tab(text: 'Station Details'),
            Tab(text: 'About'),
          ]),
        ),
        body: TabBarView(children: [
          StationScreen(),
          StationDetailsScreen(),
          AboutScreen(),
        ]),
      ),
    );
  }
}
