import 'package:flutter/material.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/data/models/room_model.dart';
import 'package:new_app/representation/widgets/app_bar_container_widget.dart';
import 'package:new_app/representation/widgets/item_room_widget.dart';
import 'package:new_app/representation/widgets/item_utility_hotel.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({super.key});

  static const String routeName = '/select_room_screen';

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetHelper.room1,
      roomName: 'Deluxe Room',
      size: 27,
      utility: 'Free Cancellation',
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.room2,
      roomName: 'Executive Suite',
      size: 32,
      utility: 'Non-refundable',
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.room3,
      roomName: 'King Bed Only Room',
      size: 24,
      utility: 'Non-refundable',
      price: 214,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidge(
      titleString: 'Select Room',
      implementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            ...listRoom.map((e) => ItemRoomWidget(roomModel: e)).toList()
          ],
        ),
      ),
    );
  }
}
