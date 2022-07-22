import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:noun_service_app/providers/addStation.dart';
import '../providers/addressProvider.dart';
import '../widgets/app_bar.dart';
import '../utilities/constants.dart';
import '../models/charging_types.dart';
import '../models/power_types.dart';
import '../widgets/button.dart';
import './selectAddress.dart';
import 'package:provider/provider.dart';
import '../widgets/bottom_navigation_bar.dart';

class AddStationScreen extends StatefulWidget {
  //AddStationScreen({Key? key}) : super(key: key);
  static const routeName = 'add_station';

  @override
  State<AddStationScreen> createState() => _AddStationScreenState();
}

class _AddStationScreenState extends State<AddStationScreen> {
  bool _value = false;
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  //bool _isClick = true;
  final _chrgingTypeList = [
    PowerType(title: 'AC'),
    PowerType(title: 'DC'),
  ];

  String providerName = '';
  String providerContactNumber = '';
  String providerEmail = '';
  String stationName = '';
  String stationLicenseNumber = '';
  String stationContactNumber = '';
  //String stationAddress = '';

  final TextEditingController nameOfProvider = TextEditingController();
  final TextEditingController contactProvider = TextEditingController();
  final TextEditingController nameStation = TextEditingController();
  final TextEditingController emailProvider = TextEditingController();
  final TextEditingController licenseNumber = TextEditingController();
  final TextEditingController contactNumberStation = TextEditingController();

  List<dynamic> options = [
    {'type': 'AC', 'value': false},
    {'type': 'DC', 'value': false}
  ];

  // final _powerTypeList = [
  //   PowerType(title: 'AC'),
  //   PowerType(title: 'DC'),
  // ];

  final List<String> _powerTypeList = ['AC', 'DC'];

  Widget _buildSingleCheckbox(PowerType chargingType) =>
      _buildCheckbox(chargingType);

  Widget _buildCheckbox(PowerType chargingType) => Container(
        width: MediaQuery.of(context).size.width * 0.35,
        // color: Colors.red,
        child: ListTile(
          leading: Checkbox(
            value: chargingType.value,
            onChanged: (value) => setState(
              () {
                print('CheckBox: $value');
                chargingType.value = value!;
              },
            ),
          ),
          title: Container(
            width: 100,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                chargingType.title,
              ),
            ),
          ),
        ),
      );

  // Widget _buildSingleCheckboxPowerType(PowerType powerType) =>
  //     _buildCheckboxPowerType(powerType);

  // Widget _buildCheckboxPowerType(PowerType powerType) => Container(
  //       width: MediaQuery.of(context).size.width * 0.35,
  //       child: ListTile(
  //         leading: Checkbox(
  //           value: powerType.value,
  //           onChanged: (value) => setState(
  //             () {
  //               powerType.value = value!;
  //               print('Value: $value');
  //             },
  //           ),
  //         ),
  //         title: Text(powerType.title),
  //       ),
  //     );

  //int _isClick = 1;
  //String level1 = 'power';
  // String level2 = 'poweron';
  // String level3 = 'on';

  int level2 = 0;
  int level3 = 0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final addressProvider =
        Provider.of<LocationProvider>(context).newAddressSet;
    final coordinates = Provider.of<LocationProvider>(context).coorDinates;

    return Scaffold(
      appBar: MyAppBar('Add Station', true),
      body: Form(
        key: key,
        child: ListView(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Row(
                children: const [
                  Text(
                    'Provider Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff00ffba),
                      offset: Offset(1, 1), //change done
                      blurRadius: 3, //change done
                      spreadRadius: 0.1), //change done
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(-1, -1), //change done
                    blurRadius: 3, //change done
                  )
                ],
              ),
              child: TextFormField(
                // onChanged: (value) {
                //   providerName = value;
                // },
                controller: nameOfProvider,
                cursorColor: Theme.of(context).primaryColor,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Provider Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Provider Name';
                  } else {
                    providerName = value;
                    return value;
                  }
                },
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.04,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Row(
                children: const [
                  Text(
                    'Provider Contact Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff00ffba),
                      offset: Offset(1, 1), //change done
                      blurRadius: 3, //change done
                      spreadRadius: 0.1), //change done
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(-1, -1), //change done
                    blurRadius: 3, //change done
                  )
                ],
              ),
              child: TextFormField(
                // onChanged: (value) {
                //   providerContactNumber = value;
                // },
                controller: contactProvider,
                cursorColor: Theme.of(context).primaryColor,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Provider Contact Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Provider Contact Number';
                  } else {
                    providerContactNumber = value;
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.04,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Row(
                children: const [
                  Text(
                    'Station Name',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff00ffba),
                      offset: Offset(1, 1), //change done
                      blurRadius: 3, //change done
                      spreadRadius: 0.1), //change done
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(-1, -1), //change done
                    blurRadius: 3, //change done
                  )
                ],
              ),
              child: TextFormField(
                // onChanged: (value) {
                //   stationName = value;
                // },
                controller: nameStation,
                cursorColor: Theme.of(context).primaryColor,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Station Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Station Name';
                  } else {
                    stationName = value;
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Row(
                children: const [
                  Text(
                    'Provider Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff00ffba),
                      offset: Offset(1, 1), //change done
                      blurRadius: 3, //change done
                      spreadRadius: 0.1), //change done
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(-1, -1), //change done
                    blurRadius: 3, //change done
                  )
                ],
              ),
              child: TextFormField(
                // onChanged: (value) {
                //   providerEmail = value;
                // },
                controller: emailProvider,
                cursorColor: Theme.of(context).primaryColor,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Station Email'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Station Email';
                  } else {
                    providerEmail = value;
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.04,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Row(
                children: const [
                  Text(
                    'Station License Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff00ffba),
                      offset: Offset(1, 1), //change done
                      blurRadius: 3, //change done
                      spreadRadius: 0.1), //change done
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(-1, -1), //change done
                    blurRadius: 3, //change done
                  )
                ],
              ),
              child: TextFormField(
                // onChanged: (value) {},
                controller: licenseNumber,
                cursorColor: Theme.of(context).primaryColor,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Station License Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Station License Number';
                  } else {
                    stationLicenseNumber = value;
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Row(
                children: const [
                  Text(
                    'Station Contact Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff00ffba),
                      offset: Offset(1, 1), //change done
                      blurRadius: 3, //change done
                      spreadRadius: 0.1), //change done
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(-1, -1), //change done
                    blurRadius: 3, //change done
                  )
                ],
              ),
              child: TextFormField(
                // onChanged: (value) {
                //   stationContactNumber = value;
                // },
                controller: contactNumberStation,
                cursorColor: Theme.of(context).primaryColor,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Station Contact Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Station Contact Number';
                  } else {
                    stationContactNumber = value;
                    return null;
                  }
                },
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Row(
                children: const [
                  Text(
                    'Station Address',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            InkWell(
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SelectAddress())),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 0.0),
                padding: EdgeInsets.only(
                    left: mediaQuery.width * 0.04,
                    top: mediaQuery.height * 0.01,
                    right: mediaQuery.width * 0.04),
                height: mediaQuery.height * 0.12,
                decoration: BoxDecoration(
                  color: Color(0xff1f1f1f),
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xff00ffba),
                        offset: Offset(1, 1),
                        blurRadius: 3, //change done
                        spreadRadius: 0.0), //change done
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(-1, -1), //change done
                      blurRadius: 3, //change done
                    )
                  ],
                ),
                child: Text(
                  addressProvider == '' ? 'Station Address' : addressProvider,
                  style:
                      const TextStyle(color: Color(0xff62676e), fontSize: 14),
                ),
                // child: TextField(
                //   onChanged: (value) {},
                //   cursorColor: Theme.of(context).primaryColor,
                //   decoration:
                //       kTextFieldDecoration.copyWith(hintText: 'Contact Number'),
                // ),
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Charging Type',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Row(
                children: [
                  Container(
                    height: mediaQuery.height * 0.06,
                    width: mediaQuery.width * 0.1,
                    // color: Colors.red,
                    child: Checkbox(
                        value: options[0]['value'],
                        onChanged: (value) {
                          setState(() {
                            options[0]['value'] = value;
                          });
                        }),
                  ),
                  SizedBox(width: mediaQuery.width * 0.01),
                  const Text(
                    'AC',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: mediaQuery.width * 0.06),
                  Container(
                    height: mediaQuery.height * 0.06,
                    width: mediaQuery.width * 0.1,
                    // color: Colors.red,
                    child: Checkbox(
                        value: options[1]['value'],
                        onChanged: (value) {
                          setState(() {
                            options[1]['value'] = value;
                          });
                        }),
                  ),
                  SizedBox(width: mediaQuery.width * 0.01),
                  const Text(
                    'DC',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.005,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.09),
              child: Column(
                children: <Widget>[
                  SizedBox(height: mediaQuery.height * 0.01),
                  Column(
                    children: <Widget>[
                      Row(
                        children: const [
                          Text(
                            'Cafe',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                              value: 0,
                              groupValue: level2,
                              onChanged: (isClick2) {
                                setState(() {
                                  level2 = 0;
                                });
                              }),
                          Text("Yes"),
                          Radio(
                            value: 1,
                            groupValue: level2,
                            onChanged: (isClick2) {
                              setState(() {
                                level2 = 1;
                              });
                            },
                          ),
                          Text("No"),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: mediaQuery.height * 0.01),
                  Column(
                    children: <Widget>[
                      Row(
                        children: const [
                          Text(
                            'Park',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Radio(
                            value: 0,
                            groupValue: level3,
                            onChanged: (isClick3) {
                              setState(() {
                                level3 = 0;
                              });
                            },
                          ),
                          Text("Yes"),
                          Radio(
                            value: 1,
                            groupValue: level3,
                            onChanged: (isClick3) {
                              setState(() {
                                level3 = 1;
                              });
                            },
                          ),
                          Text("No"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.02,
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Center(
                child: Button('SAVE', () {
              print('Clicked');
              if (key.currentState!.validate()) {
                // Provider.of<AddStation>(context, listen: false).postStation(
                //     nameOfProvider.text,
                //     providerEmail,
                //     contactProvider.text,
                //     nameStation.text,
                //     stationLicenseNumber,
                //     stationContactNumber,
                //     options,
                //     level2,
                //     level3,
                //     // address,
                //     // latitude,
                //     // longitude
                //     addressProvider,
                //     coordinates['lat'],
                //     coordinates['lng']);
                addNewStation(
                    nameOfProvider.text,
                    providerEmail,
                    contactProvider.text,
                    nameStation.text,
                    stationLicenseNumber,
                    stationContactNumber,
                    options,
                    level2,
                    level3,
                    addressProvider,
                    coordinates['lat'],
                    coordinates['lng']);
              }
            })),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addNewStation(
      String providerName,
      String providerEmail,
      String providerContactNumber,
      String stationName,
      String stationLicenseNumber,
      String stationContactNumber,
      List<dynamic> options,
      int level2,
      int level3,
      String address,
      double latitude,
      double longitude) async {
    var response = await Provider.of<AddStation>(context, listen: false)
        .postStation(
            providerName,
            providerEmail,
            providerContactNumber,
            stationName,
            stationLicenseNumber,
            stationContactNumber,
            options,
            level2,
            level3,
            address,
            latitude,
            longitude);

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
        response['message'],
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      )));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => BottomNavigation()));
    }

    print('Post RESPONSE: $response');
  }
}
