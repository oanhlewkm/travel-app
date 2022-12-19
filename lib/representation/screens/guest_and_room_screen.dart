import 'package:flutter/material.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/core/helpers/image_helper.dart';
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
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidge(
      titleString: 'Add guest and room',
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          const ItemGuestAndRoom(
            title: 'Guest',
            icon: AssetHelper.icoGuest,
            initData: 1,
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          const ItemGuestAndRoom(
            title: 'Guest',
            icon: AssetHelper.icoBed,
            initData: 1,
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          ButtonWidget(
            title: 'Done',
            ontap: () {
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
