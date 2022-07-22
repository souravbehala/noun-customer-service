import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/config.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_data_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utilities/constants.dart';
import '../widgets/button.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'form_screen.dart';

class OtpScreen extends StatefulWidget {
  //OtpScreen({Key? key}) : super(key: key);
  static const routeName = 'otp_screen';
  final Map<String, dynamic> otpResponse;

  @override
  State<OtpScreen> createState() => _OtpScreenState();

  OtpScreen(this.otpResponse);
}

class _OtpScreenState extends State<OtpScreen> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  var _firstField;
  var _secondField;
  var _thirdField;
  var _fourthField;
  var phoneNumber;
  var otp;
  var userID;
  var userData;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    phoneNumber =
        Provider.of<UserDataContainer>(context, listen: false).phoneNumber;
    // userID = Provider.of<UserDataContainer>(context).userID;
    // userData = Provider.of<UserDataContainer>(context,
    //     listen: false); //taking the whole userData map
    // phoneNumber = userData.phoneNumber;
    // userID = userData.userID;
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  // Future<void> _submitOTP(
  //     {required BuildContext context,
  //     required String firstVal,
  //     required String secondVal,
  //     required String thirdVal,
  //     required String fourthVal}) async {
  //   otp = '$firstVal$secondVal$thirdVal$fourthVal';
  //   print('OTP: $otp');
  //   try {
  //     var response = await http.post(
  //       Uri.parse('$baseURL/station/verify-otp'),
  //       body: json.encode({
  //         "phone": phoneNumber,
  //         "otp": otp,
  //       }),
  //       headers: {'Content-Type': 'application/json'},
  //     );
  //     if (response.statusCode == 202) {
  //       print('response: ${response.body}');
  //       //print('otp verified');

  //       final convertedData = json.decode(response.body); //parsing json data
  //       userID = convertedData['userData'][0]['id'];
  //       print('userID: $userID');
  //       print('${userID.runtimeType}');
  //       userData.userID = userID;
  //       //print('status: ${convertedData['status']}');
  //       Navigator.pushNamed(context, FormScreen.routeName);
  //     } else {
  //       final text = 'Incorrect OTP';
  //       final snackBar = SnackBar(
  //         content: Text(
  //           text,
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         backgroundColor: Colors.redAccent,
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //       print('failed');
  //     }
  //   } catch (e) {
  //     final text = 'Error occurred';
  //     final snackBar = SnackBar(content: Text(text));

  //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
  //     print(e.toString());
  //   }
  // }

  // void _submit(
  //     {required BuildContext context,
  //     required String firstVal,
  //     required String secondVal,
  //     required String thirdVal,
  //     required String fourthVal}) async {
  //   try {
  //     await Provider.of<UserDataContainer>(context, listen: false).submitOTP(
  //         context: context,
  //         firstVal: firstVal,
  //         secondVal: secondVal,
  //         thirdVal: thirdVal,
  //         fourthVal: fourthVal);
  //     //Navigator.pushNamed(context, FormScreen.routeName);
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: kScaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'OTP VERIFICATION',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(
              height: mediaQuery.height * 0.05,
            ),
            Text(
              'We need to send OTP to authenticate your number',
            ),
            SizedBox(
              height: mediaQuery.height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1f1f1f),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff00ffba),
                          offset: Offset(0, 0),
                          blurRadius: 3, //change done
                          spreadRadius: 0.3, //change done
                        ),
                      ],
                    ),
                    width: 60,
                    child: TextFormField(
                      autofocus: true,
                      // obscureText: true,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: InputBorder.none),
                      onChanged: (value) {
                        _firstField = value;
                        nextField(value, pin2FocusNode);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1f1f1f),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff00ffba),
                          offset: Offset(0, 0),
                          blurRadius: 3, //change done
                          spreadRadius: 0.3, //change done
                        ),
                      ],
                    ),
                    width: 60,
                    child: TextFormField(
                      focusNode: pin2FocusNode,
                      autofocus: true,
                      // obscureText: true,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: InputBorder.none),
                      onChanged: (value) {
                        _secondField = value;
                        nextField(value, pin3FocusNode);
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1f1f1f),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff00ffba),
                          offset: Offset(0, 0),
                          blurRadius: 3, //change done
                          spreadRadius: 0.3, //change done
                        ),
                      ],
                    ),
                    width: 60,
                    child: TextFormField(
                        focusNode: pin3FocusNode,
                        autofocus: true,
                        // obscureText: true,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(border: InputBorder.none),
                        onChanged: (value) {
                          _thirdField = value;
                          nextField(value, pin4FocusNode);
                        }),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff1f1f1f),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xff00ffba),
                          offset: Offset(0, 0),
                          blurRadius: 3, //change done
                          spreadRadius: 0.3, //change done
                        ),
                      ],
                    ),
                    width: 60,
                    child: TextFormField(
                      focusNode: pin4FocusNode,
                      autofocus: true,
                      // obscureText: true,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      keyboardType: TextInputType.number,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(border: InputBorder.none),
                      onChanged: (value) {
                        if (value.length == 1) {
                          _fourthField = value;
                          pin4FocusNode!.unfocus();
                          // Then you need to check is the code is correct or not
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.height * 0.2,
            ),
            Button('VERIFY', () {
              Timer(const Duration(milliseconds: 500), () {
                print('firstField: $_firstField');
                print('secondField: $_secondField');
                print('thirdField: $_thirdField');
                print('fourthField: $_fourthField');
                print('phoneNumber: $phoneNumber');
                _submit(
                    context: context,
                    firstVal: _firstField,
                    secondVal: _secondField,
                    thirdVal: _thirdField,
                    fourthVal: _fourthField,
                    phoneNumber: phoneNumber,
                    otpResponse: widget.otpResponse);
              });
              // Timer(const Duration(milliseconds: 500),
              //     () => Navigator.pushNamed(context, FormScreen.routeName));
            }),
          ],
        ),
      ),
    );
  }

  void _submit(
      {required BuildContext context,
      required firstVal,
      required secondVal,
      required thirdVal,
      required fourthVal,
      required phoneNumber,
      required otpResponse}) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var response = await Provider.of<UserDataContainer>(context, listen: false)
        .submitOTP(
            context: context,
            firstVal: firstVal,
            secondVal: secondVal,
            thirdVal: thirdVal,
            fourthVal: fourthVal,
            phoneNumber: phoneNumber);

    if (otpResponse['type'] == 'not-exist' &&
        response['message'] == 'Login success') {
      print('BLOCKED JOY');

      localStorage.setString('token', response['accessToken']);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['message'],
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));

      // Navigator.of(context).pushNamed(FormScreen.routeName);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => FormScreen()));
    } else if (otpResponse['type'] == 'exist' &&
        response['message'] == 'Login success') {
      print('BLOCKED RICHED');

      localStorage.setString('token', response['accessToken']);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['message'],
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));

      Navigator.of(context).pushNamed(BottomNavigation.routeName);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(response['message'],
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
  }
}
