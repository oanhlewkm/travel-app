import 'package:flutter/material.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/data/models/hotel_model.dart';
import 'package:new_app/representation/widgets/app_bar_container_widget.dart';
import 'package:new_app/representation/widgets/item_hotel_widget.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});
  static String routeName = '/hotels_screen';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  final List<HotelModel> listHotel = [
    HotelModel(
      hotelImage: AssetHelper.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      star: 4.5,
      numOfReview: 3241,
      price: 143,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel2,
      hotelName: 'Grand Luxury\'s',
      location: 'Banyumas, Jateng',
      awayKilometer: '2.3 km',
      star: 4.2,
      numOfReview: 3241,
      price: 234,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '1.1 km',
      star: 3.8,
      numOfReview: 1234,
      price: 132,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidge(
      implementLeading: true,
      titleString: 'Hotels',
      child: SingleChildScrollView(
        child: Column(
          children:
              listHotel.map((e) => ItemHotelWidget(hotelModel: e)).toList(),
        ),
      ),
    );
  }
}
