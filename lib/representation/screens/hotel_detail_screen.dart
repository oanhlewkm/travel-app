import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:new_app/core/constants/color_palatte.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/constants/textstyle_ext.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/core/helpers/image_helper.dart';
import 'package:new_app/data/models/hotel_model.dart';
import 'package:new_app/representation/screens/select_room_screen.dart';
import 'package:new_app/representation/widgets/button_widget.dart';
import 'package:new_app/representation/widgets/dashline_widget.dart';
import 'package:new_app/representation/widgets/item_utility_hotel.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key, required this.hotelModel});
  static const String routeName = '/hotel_detail_screen';
  final HotelModel hotelModel;
  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.hotelScreen,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: const EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultPadding),
                  ),
                ),
                child: const Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                ),
              ),
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(kItemPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultPadding),
                  ),
                ),
                child: const Icon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.red,
                  size: 18,
                ),
              ),
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.3,
            minChildSize: 0.3,
            maxChildSize: 0.8,
            builder: ((context, scrollController) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kDefaultPadding * 2),
                    topRight: Radius.circular(kDefaultPadding * 2),
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(kDefaultPadding),
                      child: Container(
                        height: 5,
                        width: 60,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              kItemPadding,
                            ),
                          ),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: kDefaultPadding,
                    ),
                    Expanded(
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.hotelModel.hotelName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                                maxLines: 1,
                              ),
                              const Spacer(),
                              Text(
                                '\$${widget.hotelModel.price}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              const Text(
                                '/night',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(
                                AssetHelper.icoLocationBlank,
                              ),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              Text(
                                widget.hotelModel.location,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Row(
                            children: [
                              ImageHelper.loadFromAsset(
                                AssetHelper.icoStar,
                              ),
                              const SizedBox(
                                width: kDefaultPadding,
                              ),
                              Text(
                                '${widget.hotelModel.star}/5',
                              ),
                              Text(
                                ' (${widget.hotelModel.numOfReview} reviews)',
                                style: const TextStyle(
                                  color: ColorPalette.subTitleColor,
                                ),
                              ),
                              const Spacer(),
                              const Text(
                                'See all',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorPalette.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const DashlineWidget(
                            color: ColorPalette.dividerColor,
                          ),
                          const Text(
                            'Information',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(
                            height: kItemPadding,
                          ),
                          const Text(
                            '''You will find every comfort because many of the services that the hotel offers for travellers and of course the hotel is very comfortable.''',
                          ),
                          const ItemUtilityHotelWidget(),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          Text(
                            'Location',
                            style: TextStyles.defaultStyle.bold,
                          ),
                          const SizedBox(
                            height: kItemPadding,
                          ),
                          const Text(
                            '''Located in the famous neighborhood of Seoul, Grand Luxury’s is set in a building built in the 2010s.''',
                          ),
                          const SizedBox(
                            height: kDefaultPadding,
                          ),
                          ImageHelper.loadFromAsset(
                            AssetHelper.imageMap,
                            width: double.infinity,
                          ),
                          const SizedBox(
                            height: kMediumPadding,
                          ),
                          ButtonWidget(
                              title: 'Select Room',
                              ontap: () {
                                Navigator.of(context)
                                    .pushNamed(SelectRoomScreen.routeName);
                              }),
                          const SizedBox(
                            height: kMediumPadding,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
