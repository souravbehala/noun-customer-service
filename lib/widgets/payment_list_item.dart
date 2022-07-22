import 'package:flutter/material.dart';

class PaymentListItem extends StatelessWidget {
  // const BookingListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
          color: const Color(0xff1f1f1f),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2),
              blurRadius: 5, //change done
              spreadRadius: 0.3, //change done
            ),
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Date'),
              Text(
                '2/2/2022',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.height * 0.001,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: .5,
          ),
          SizedBox(
            height: mediaQuery.height * 0.001,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Price'),
              Text(
                '₹ 456',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.height * 0.001,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: .5,
          ),
          SizedBox(
            height: mediaQuery.height * 0.001,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Time'),
              Text(
                '9:50 am',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: mediaQuery.height * 0.001,
          ),
          Divider(
            color: Theme.of(context).primaryColor,
            thickness: .5,
          ),
          SizedBox(
            height: mediaQuery.height * 0.001,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Power'),
              Text(
                '50KwH',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
