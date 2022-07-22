import 'package:flutter/material.dart';

class CarouselBookingItem extends StatelessWidget {
  //const CarouselBookingItem({Key? ke//y}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      //height: mediaQuery.height * 0.,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff1f1f1f),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2), //change done
              blurRadius: 3, //change done
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: mediaQuery.height * 0.15,
              width: mediaQuery.width * 0.3,
              decoration: BoxDecoration(
                  // image: DecorationImage(
                  //   image: AssetImage('assets/images/back.png'),
                  //   fit: BoxFit.fill,
                  // ),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Theme.of(context).primaryColor),
                  // color: Colors.blue,
                  color: const Color(0xff1f1f1f),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(2, 2), //change done
                      blurRadius: 3, //change done
                    )
                  ]),
              // padding: EdgeInsets.symmetric(vertical: mediaQuery.height * 0.05),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Port Type-'),
                      Text(
                        'CCS',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Port No-'),
                      Text('1', style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   width: mediaQuery.width * 0.05,
            // ),
            Container(
              // height: mediaQuery.height * 0.01,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.05,
                      ),
                      Text('02/04/2022'),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.01,
                  ),
                  Row(
                    children: [
                      Text(
                        'Time',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.05,
                      ),
                      Text('10:00 AM'),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'Station',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.05,
                      ),
                      Text('Lightning Bolt'),
                    ],
                  ),
                  SizedBox(
                    height: mediaQuery.height * 0.02,
                  ),
                  Row(
                    children: [
                      Text(
                        'Cost',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: mediaQuery.width * 0.05,
                      ),
                      Text('₹ 852'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
