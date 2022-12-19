import 'package:flutter/material.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/representation/screens/guest_and_room_screen.dart';
import 'package:new_app/representation/screens/hotels_screen.dart';
import 'package:new_app/representation/screens/select_date_screen.dart';
import 'package:new_app/representation/widgets/app_bar_container_widget.dart';
import 'package:new_app/representation/widgets/button_widget.dart';
import 'package:new_app/representation/widgets/item_booking_widget.dart';
import 'package:new_app/core/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, this.destination});

  static const String routeName = '/hotel_booking_screen';

  final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? selectDate;
  String? guestAndRoom;

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidge(
      implementLeading: true,
      titleString: 'Hotel Booking',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: kMediumPadding * 2,
            ),
            ItemBookingWidget(
              icon: AssetHelper.icoLocation,
              title: 'Destination',
              description: widget.destination ?? "Vietnam",
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(
              builder: (context, setState) {
                return ItemBookingWidget(
                  icon: AssetHelper.icoCalendal,
                  title: 'Select Date',
                  description: selectDate ?? 'Select Date',
                  onTap: () async {
                    final result = await Navigator.of(context)
                        .pushNamed(SelectDateScreen.routeName);
                    if (result != null &&
                        !(result as List<DateTime?>)
                            .any((element) => element == null)) {
                      selectDate =
                          '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                      setState(() {});
                    }
                  },
                );
              },
            ),
            const SizedBox(
              height: kMediumPadding,
            ),
            StatefulBuilder(builder: ((context, setState) {
              return ItemBookingWidget(
                icon: AssetHelper.icoBed,
                title: 'Guest and Room',
                description: guestAndRoom ?? "1 Guest, 1 Room",
                onTap: () async {
                  final result = await Navigator.of(context)
                      .pushNamed(GuestAndRoomScreen.routeName);
                  if (result is List<int>) {
                    guestAndRoom = '${result[0]} Guest, ${result[1]} Room';
                    setState(() {});
                  }
                },
              );
            })),
            const SizedBox(
              height: kMediumPadding,
            ),
            ButtonWidget(
              title: 'Search',
              ontap: () {
                Navigator.of(context).pushNamed(HotelsScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
