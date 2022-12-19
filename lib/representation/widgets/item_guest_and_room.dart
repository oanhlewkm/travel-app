import 'package:flutter/material.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/core/helpers/image_helper.dart';

class ItemGuestAndRoom extends StatefulWidget {
  const ItemGuestAndRoom({
    super.key,
    required this.title,
    required this.icon,
    required this.initData,
  });
  final String title;
  final String icon;
  final int initData;

  @override
  State<ItemGuestAndRoom> createState() => ItemGuestAndRoomState();
}

class ItemGuestAndRoomState extends State<ItemGuestAndRoom> {
  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.initData;
    _textEditingController = TextEditingController(
      text: widget.initData.toString(),
    )..addListener(() {
        number = int.parse(_textEditingController.text);
      });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.all(kMediumPadding),
          margin: const EdgeInsets.only(bottom: kMediumPadding),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(kItemPadding),
            ),
          ),
          child: Row(
            children: [
              ImageHelper.loadFromAsset(widget.icon, width: 36, height: 36),
              const SizedBox(
                width: kItemPadding,
              ),
              Text(widget.title),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  if (number > 1) {
                    setState(() {
                      number--;
                      _textEditingController.text = number.toString();
                      if (_focusNode.hasFocus) {
                        _focusNode.unfocus();
                      }
                    });
                  }
                },
                child: ImageHelper.loadFromAsset(AssetHelper.icoDecre),
              ),
              Container(
                height: 35,
                width: 60,
                padding: const EdgeInsets.only(left: 3),
                alignment: Alignment.center,
                child: TextField(
                  controller: _textEditingController,
                  focusNode: _focusNode,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(bottom: 18),
                  ),
                  autocorrect: true,
                  minLines: 1,
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  onChanged: (value) {},
                  onSubmitted: (String submitValue) {},
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    number++;
                    _textEditingController.text = number.toString();
                    if (_focusNode.hasFocus) {
                      _focusNode.unfocus();
                    }
                  });
                },
                child: ImageHelper.loadFromAsset(AssetHelper.icoIncre),
              ),
            ],
          ),
        );
      },
    );
  }
}
