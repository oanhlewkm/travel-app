import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/core/constants/textstyle_ext.dart';
import 'package:new_app/core/helpers/image_helper.dart';
import 'package:new_app/core/helpers/asset_helper.dart';
import 'package:new_app/representation/screen/main_app.dart';
import 'package:new_app/representation/widgets/button_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static String routeName = '/Intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  final StreamController<int> _pageStreamController =
      StreamController<int>.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      // print(_pageController.page);
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  Widget _buildItemControllerScreen(
    String imgName,
    String title,
    String description,
    AlignmentGeometry alignment,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          alignment: alignment,
          child: ImageHelper.loadFromAsset(
            imgName,
            height: 450,
            fit: BoxFit.fitHeight,
          ),
        ),
        const SizedBox(
          height: kMediumPadding * 2,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kMediumPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyles.defaultStyle.bold,
              ),
              const SizedBox(
                height: kMediumPadding,
              ),
              Text(
                description,
                style: TextStyles.defaultStyle,
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          children: [
            _buildItemControllerScreen(
              AssetHelper.slide1,
              'Book a flight',
              'Found a flight that matches your destination and schedule? Book it instantly.',
              Alignment.centerRight,
            ),
            _buildItemControllerScreen(
              AssetHelper.slide2,
              'Find a hotel room',
              'Select the day, book your room. We give you the best price.',
              Alignment.center,
            ),
            _buildItemControllerScreen(
              AssetHelper.slide3,
              'Enjoy your trip',
              'Easy discovering new places and share these between your friends and travel together.',
              Alignment.centerLeft,
            ),
          ],
        ),
        Positioned(
          left: kMediumPadding,
          right: kMediumPadding,
          bottom: kMediumPadding * 3,
          child: Row(
            children: [
              Expanded(
                flex: 6,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    dotWidth: kMinPadding,
                    dotHeight: kMinPadding,
                    activeDotColor: Colors.orange,
                  ),
                ),
              ),
              StreamBuilder<int>(
                initialData: 0,
                stream: _pageStreamController.stream,
                builder: (context, snapshot) {
                  return Expanded(
                    flex: 4,
                    child: ButtonWidget(
                      title: snapshot.data != 2 ? 'Next' : 'Get started',
                      ontap: () => {
                        if (_pageController.page != 2)
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn,
                          )
                        else
                          Navigator.of(context).pushNamed(MainApp.routeName)
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
