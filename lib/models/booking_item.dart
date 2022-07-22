class BookingItem {
  final String id;
  final String carImg;
  final String carBrand;
  final String carType;
  final String bookingDate;
  final String bookingTime;
  final String bookingPower;
  final String bookingPrice;
  final String portType;

  BookingItem({
    required this.bookingDate,
    required this.bookingPower,
    required this.bookingPrice,
    required this.bookingTime,
    required this.carBrand,
    required this.carImg,
    required this.carType,
    required this.id,
    required this.portType,
  });
}
