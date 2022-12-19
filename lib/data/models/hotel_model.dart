class HotelModel {
  HotelModel({
    required this.hotelImage,
    required this.hotelName,
    required this.location,
    required this.awayKilometer,
    required this.star,
    required this.price,
    required this.numOfReview,
  });
  final String hotelImage;
  final String hotelName;
  final String location;
  final String awayKilometer;
  final double star;
  final double price;
  final int numOfReview;
}
