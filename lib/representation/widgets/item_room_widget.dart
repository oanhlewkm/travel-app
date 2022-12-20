import 'package:flutter/material.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/constants/textstyle_ext.dart';
import 'package:new_app/core/helpers/image_helper.dart';
import 'package:new_app/data/models/room_model.dart';
import 'package:new_app/representation/screens/checkout_screen.dart';
import 'package:new_app/representation/widgets/button_widget.dart';
import 'package:new_app/representation/widgets/dashline_widget.dart';
import 'package:new_app/representation/widgets/item_utility_hotel.dart';

class ItemRoomWidget extends StatelessWidget {
  const ItemRoomWidget({super.key, required this.roomModel, this.numberOfRoom});
  final RoomModel roomModel;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kItemPadding),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      roomModel.roomName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Text(
                      'Room Size: ${roomModel.size} m2',
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Text(roomModel.utility),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: ImageHelper.loadFromAsset(
                  roomModel.roomImage,
                  radius: BorderRadius.circular(kItemPadding),
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding),
          const ItemUtilityHotelWidget(),
          const DashlineWidget(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.price.toString()}',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    const SizedBox(
                      height: kMinPadding,
                    ),
                    Text(
                      '/night',
                      style: TextStyles.defaultStyle.fontCaption,
                    )
                  ],
                ),
              ),
              Expanded(
                child: numberOfRoom == null
                    ? ButtonWidget(
                        title: 'Choose',
                        ontap: () {
                          Navigator.of(context).pushNamed(
                            CheckoutScreen.routeName,
                            arguments: roomModel,
                          );
                        },
                      )
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              )
            ],
          )
        ],
      ),
    );
  }
}
