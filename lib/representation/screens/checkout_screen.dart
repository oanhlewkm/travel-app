import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/core/constants/color_palatte.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/core/helpers/image_helper.dart';
import 'package:new_app/data/models/room_model.dart';
import 'package:new_app/representation/widgets/app_bar_container_widget.dart';
import 'package:new_app/representation/widgets/button_widget.dart';
import 'package:new_app/representation/widgets/item_room_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.roomModel});
  static const String routeName = '/checkout_screen';
  final RoomModel roomModel;
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<String> listStep = [
    'Book and Review',
    'Payment',
    'Confirm',
  ];

  Widget _buildItemStep(
    int step,
    String stepName,
    bool isEnd,
    bool isCheck,
  ) {
    return Row(
      children: [
        Container(
          height: kMediumPadding,
          width: kMediumPadding,
          decoration: BoxDecoration(
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(kMediumPadding),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyle(
              fontWeight: isCheck ? FontWeight.bold : FontWeight.w400,
              color: isCheck ? Colors.black : Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: kMinPadding,
        ),
        Text(
          stepName,
          style: TextStyle(
            fontWeight: isCheck ? FontWeight.bold : FontWeight.w400,
            color: Colors.white,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          const SizedBox(
            width: kDefaultPadding,
            child: Divider(
              color: Colors.white,
              height: 1,
              thickness: 1,
            ),
          ),
        if (!isEnd)
          const SizedBox(
            width: kMinPadding,
          ),
      ],
    );
  }

  Widget _buildItemOptionCheckout(
    String icon,
    String title,
    String value,
    BuildContext context,
  ) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(kItemPadding),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ImageHelper.loadFromAsset(icon, height: 40, width: 40),
              const SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              )
            ],
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: ColorPalette.primaryColor.withOpacity(0.15),
              borderRadius: BorderRadius.circular(40),
            ),
            padding: const EdgeInsets.all(kMinPadding),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  margin: const EdgeInsets.all(2),
                  child: const Icon(
                    FontAwesomeIcons.plus,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: kDefaultPadding,
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ColorPalette.primaryColor,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidge(
      titleString: 'Checkout',
      implementLeading: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: listStep
                  .map(
                    (e) => _buildItemStep(
                      listStep.indexOf(e) + 1,
                      e,
                      listStep.indexOf(e) == listStep.length - 1,
                      false,
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ItemRoomWidget(
              roomModel: widget.roomModel,
              numberOfRoom: 1,
            ),
            _buildItemOptionCheckout(
              AssetHelper.icoUser,
              'Contact Details',
              'Add Contact',
              context,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            _buildItemOptionCheckout(
              AssetHelper.icoPromo,
              'Promo Code',
              'Add Promo Code',
              context,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            ButtonWidget(
              title: 'Payment',
              ontap: () {},
            )
          ],
        ),
      ),
    );
  }
}
