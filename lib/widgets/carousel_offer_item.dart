import 'package:flutter/material.dart';

class CarouselOfferItem extends StatelessWidget {
  //const CarouselBookingItem({Key? ke//y}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/offer2.png'),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff1f1f1f),
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2, 2), //change done
              blurRadius: 3, //change done
            )
          ]),
    );
  }
}
