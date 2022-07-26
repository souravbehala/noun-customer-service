import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../widgets/app_bar.dart';

class QRCodeScreen extends StatefulWidget {
  // QRCodeScreen({Key? key}) : super(key: key);
  static const routeName = 'QRCodeScreen';

  @override
  State<QRCodeScreen> createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar('QR Code', true),
      body: SingleChildScrollView(
        child: Container(
          height: mediaQuery.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrImage(
                data: controller.text,
                size: mediaQuery.height * 0.3,
                backgroundColor: Colors.white,
              ),
              SizedBox(
                height: mediaQuery.height * 0.05,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 30.0),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: 'Enter the data',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                        color: Colors.blueGrey,
                      ),
                    ),
                    suffixIcon: IconButton(
                      color: Colors.lightBlueAccent,
                      icon: Icon(
                        Icons.done,
                        size: 30,
                      ),
                      onPressed: () => setState(() {}),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * 0.15,
              ),
              Text(
                'Scan QR Code',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: mediaQuery.height * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
