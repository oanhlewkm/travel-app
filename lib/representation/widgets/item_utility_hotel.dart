import 'package:flutter/material.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/core/helpers/image_helper.dart';

class ItemUtilityHotelWidget extends StatelessWidget {
  const ItemUtilityHotelWidget({super.key});

  static const List<Map<String, String>> listUtilityHotel = [
    {'icon': AssetHelper.icoWifi, 'name': 'Free\nWifi'},
    {'icon': AssetHelper.icoNonRefund, 'name': 'Non-\nRefundable'},
    {'icon': AssetHelper.icoBreakfast, 'name': 'Free-\nBreakfast'},
    {'icon': AssetHelper.icoNonSmoke, 'name': 'Non-\nSmoking'},
  ];

  Widget _buildItemUtilityHote(
    String icon,
    String title,
  ) {
    return Column(
      children: [
        ImageHelper.loadFromAsset(icon),
        const SizedBox(
          height: kItemPadding,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: kItemPadding,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: listUtilityHotel
            .map((e) => _buildItemUtilityHote(e['icon']!, e['name']!))
            .toList(),
      ),
    );
  }
}
