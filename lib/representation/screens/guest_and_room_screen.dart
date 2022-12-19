import 'package:flutter/material.dart';
import 'package:new_app/core/constants/color_palatte.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/representation/widgets/app_bar_container_widget.dart';
import 'package:new_app/representation/widgets/button_widget.dart';
import 'package:new_app/representation/widgets/item_guest_and_room.dart';

class GuestAndRoomScreen extends StatefulWidget {
  const GuestAndRoomScreen({super.key});
  static const String routeName = '/guest_and_room_screen';

  @override
  State<GuestAndRoomScreen> createState() => _GuestAndRoomScreenState();
}

class _GuestAndRoomScreenState extends State<GuestAndRoomScreen> {
  final GlobalKey<ItemGuestAndRoomState> _itemCountGuest =
      GlobalKey<ItemGuestAndRoomState>();
  final GlobalKey<ItemGuestAndRoomState> _itemCountRoom =
      GlobalKey<ItemGuestAndRoomState>();

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidge(
      titleString: 'Add guest and room',
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          ItemGuestAndRoom(
            title: 'Guest',
            key: _itemCountGuest,
            icon: AssetHelper.icoGuest,
            initData: 1,
          ),
          ItemGuestAndRoom(
            title: 'Room',
            icon: AssetHelper.icoBed,
            initData: 1,
            key: _itemCountRoom,
          ),
          const SizedBox(
            height: kDefaultPadding,
          ),
          ButtonWidget(
            title: 'Done',
            ontap: () {
              Navigator.of(context).pop([
                _itemCountGuest.currentState!.number,
                _itemCountRoom.currentState!.number
              ]);
            },
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            color: ColorPalette.primaryColor.withOpacity(0.1),
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
