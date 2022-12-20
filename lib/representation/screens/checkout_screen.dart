import 'package:flutter/material.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/data/models/room_model.dart';
import 'package:new_app/representation/widgets/app_bar_container_widget.dart';
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
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    kItemPadding,
                  ),
                ),
              ),
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
