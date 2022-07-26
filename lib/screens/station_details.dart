import 'package:flutter/material.dart';
import '../utilities/constants.dart';
import 'package:provider/provider.dart';
import '../providers/stationNameList.dart';

class StationDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> stationDetails;

  StationDetailsScreen(this.stationDetails);

  StationDetailsScreenState createState() => StationDetailsScreenState();
}

class StationDetailsScreenState extends State<StationDetailsScreen> {
  //const StationDetailsScreen({Key? key}) : super(key: key);
  // var initialStation;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   initialStation =
  //       Provider.of<StationNameList>(context, listen: false).stationDetails;
  //   super.initState();
  // }

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
        child: widget.stationDetails == {}
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
                              widget.stationDetails['data']['stationName'],
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
                                widget.stationDetails['data']
                                                ['powerTypeIsDc'] ==
                                            'DC' &&
                                        widget.stationDetails['data']
                                                ['powerTypeIsAc'] ==
                                            'AC'
                                    ? 'AC/DC Available'
                                    : widget.stationDetails['data']
                                                    ['powerTypeIsDc'] ==
                                                '' &&
                                            widget.stationDetails['data']
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
                            child: Text(
                                widget.stationDetails['data']['licenseNumber'],
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
