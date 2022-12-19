import 'package:flutter/material.dart';
import 'package:new_app/core/constants/color_palatte.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/constants/textstyle_ext.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/core/helpers/image_helper.dart';
import 'package:new_app/data/models/hotel_model.dart';
import 'package:new_app/representation/widgets/button_widget.dart';
import 'package:new_app/representation/widgets/dashline_widget.dart';

class ItemHotelWidget extends StatelessWidget {
  const ItemHotelWidget({super.key, required this.hotelModel});

  final HotelModel hotelModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kDefaultPadding),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(right: kBottomBarIconSize),
            child: ImageHelper.loadFromAsset(
              hotelModel.hotelImage,
              radius: const BorderRadius.only(
                topLeft: Radius.circular(kDefaultPadding),
                bottomRight: Radius.circular(kDefaultPadding),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(kBottomBarIconSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelModel.hotelName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoLocationBlank),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text(hotelModel.location),
                    Text(
                      ' - ${hotelModel.awayKilometer} from destination',
                      style: const TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding),
                Row(
                  children: [
                    ImageHelper.loadFromAsset(AssetHelper.icoStar),
                    const SizedBox(
                      width: kDefaultPadding,
                    ),
                    Text(hotelModel.star.toString()),
                    Text(
                      ' (${hotelModel.numOfReview} reviews)',
                      style: const TextStyle(
                        color: ColorPalette.subTitleColor,
                      ),
                    ),
                  ],
                ),
                const DashlineWidget(color: ColorPalette.dividerColor),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '\$${hotelModel.price.toString()}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(height: kMinPadding),
                          const Text(
                            '/night',
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ButtonWidget(
                        title: 'Book a room',
                        ontap: () {},
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
