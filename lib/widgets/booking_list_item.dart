import 'package:flutter/material.dart';

class BookingListItem extends StatelessWidget {
  // const BookingListItem({Key? key}) : super(key: key);
  final String carImg;
  final String carBrand;
  final String carType;
  final String bookingDate;
  final String bookingPrice;
  final String bookingTime;
  final String bookingPower;
  final String portType;

  BookingListItem({
    required this.bookingDate,
    required this.carBrand,
    required this.carType,
    required this.bookingPower,
    required this.bookingPrice,
    required this.bookingTime,
    required this.carImg,
    required this.portType,
  });

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: EdgeInsets.symmetric(
        vertical: mediaQuery.height * 0.01,
        horizontal: mediaQuery.width * 0.01,
      ),
      decoration: BoxDecoration(
          color: const Color(0xff1f1f1f),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 15,
              spreadRadius: 0.5,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Theme.of(context).primaryColor),
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // Image.asset(
                    //   carImg,
                    //   width: 70,
                    //   height: 70,
                    // ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Port No.'),
                        SizedBox(height: 5.0),
                        Text(
                          '1',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    VerticalDivider(
                      color: Theme.of(context).primaryColor,
                      width: 20,
                      thickness: 1,
                      indent: 1,
                      endIndent: 1,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Port Type',
                          // style: TextStyle(
                          //   fontWeight: FontWeight.bold,
                          //   fontSize: 19,
                          // ),
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          portType,
                          style: TextStyle(color: Colors.grey, fontSize: 13.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // SizedBox(
          //   width: mediaQuery.width * 0.02,
          // ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Date:',
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingDate,
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQuery.height * 0.015,
                ),
                Row(
                  children: [
                    const Text(
                      'Time:',
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingTime,
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: mediaQuery.height * 0.015,
                ),
                Row(
                  children: [
                    const Text(
                      'Power:',
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      bookingPower,
                      style: TextStyle(
                          fontSize: 13.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 15.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  VerticalDivider(
                    color: Theme.of(context).primaryColor,
                    width: 20,
                    thickness: 1,
                    indent: 1,
                    endIndent: 1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height * 0.01,
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: Container(
                          width: mediaQuery.width * 0.1,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '₹ $bookingPrice',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
