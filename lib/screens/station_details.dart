import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class StationDetailsScreen extends StatelessWidget {
  //const StationDetailsScreen({Key? key}) : super(key: key);
  final Map<String, dynamic> stationDetails;

  StationDetailsScreen(this.stationDetails);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: mediaQuery.height * 0.5,
        decoration: kContainer,
        // margin: EdgeInsets.symmetric(
        //     vertical: mediaQuery.height * 0.15, horizontal: 20.0),
        padding: EdgeInsets.symmetric(vertical: mediaQuery.height * 0.05),
        margin: EdgeInsets.symmetric(
            vertical: mediaQuery.height * 0.07,
            horizontal: mediaQuery.width * 0.05),
        child: stationDetails == {}
            ? const Center(
                child: Text('No Data Added'),
              )
            : Column(
                children: [
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Name',
                              // textAlign: TextAlign.left,
                            ),
                            // color: Colors.red,
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Container(
                            width: 110,
                            child: Text(
                              stationDetails['data']['stationName'],
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Address',
                              // textAlign: TextAlign.left,
                            ),
                            // color: Colors.red,
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Container(
                            // width: 110,
                            child: Text('489 banerjee para road, kolkata-41',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'Charging',
                              // textAlign: TextAlign.left,
                            ),
                            // color: Colors.red,
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Container(
                            width: 110,
                            child: Text(
                                stationDetails['data']['powerTypeIsDc'] ==
                                            'DC' &&
                                        stationDetails['data']
                                                ['powerTypeIsAc'] ==
                                            'AC'
                                    ? 'AC/DC Available'
                                    : stationDetails['data']['powerTypeIsDc'] ==
                                                '' &&
                                            stationDetails['data']
                                                    ['powerTypeIsAc'] ==
                                                'AC'
                                        ? 'AC Available'
                                        : 'DC Available',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Container(
                            child: Text(
                              'License Number',
                              // textAlign: TextAlign.left,
                            ),
                            // color: Colors.red,
                          ),
                          flex: 2,
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Container(
                            width: 110,
                            child: Text(stationDetails['data']['licenseNumber'],
                                style: TextStyle(fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
