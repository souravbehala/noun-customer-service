import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import '../widgets/carousel_item.dart';
// import '../widgets/video_item.dart';
import '../widgets/carousel_booking_item.dart';
import '../widgets/carousel_offer_item.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    Key? key,
    required this.mediaQuery,
    required this.text,
    required this.isVideo,
    required this.isBooking,
    required this.isOffer,
  }) : super(key: key);

  final MediaQueryData mediaQuery;
  final String text;
  final bool isVideo;
  final bool isBooking;
  final bool isOffer;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        buildCarousel(),
      ],
    );
  }

  Widget buildCarousel() {
    if (isVideo == true) {
      return CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            // return VideoItem('assets/images/Rectangle 1342.png');
            return Text('data');
          },
          options: CarouselOptions(
            height: mediaQuery.size.height * 0.28,
            enlargeCenterPage: true,
          ));
    } else if (isBooking == true) {
      return CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return CarouselBookingItem();
          },
          options: CarouselOptions(
            height: mediaQuery.size.height * 0.20,
            enlargeCenterPage: true,
          ));
    } else if (isOffer == true) {
      return CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return CarouselOfferItem();
          },
          options: CarouselOptions(
            height: mediaQuery.size.height * 0.20,
            enlargeCenterPage: true,
          ));
    } else {
      return CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            // return CarouselItem();
            return Text('data');
          },
          options: CarouselOptions(
            height: mediaQuery.size.height * 0.38,
            enlargeCenterPage: true,
          ));
    }
  }
}
