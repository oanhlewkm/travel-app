import 'package:flutter/material.dart';
import 'package:new_app/core/constants/color_palatte.dart';
import 'package:new_app/core/constants/dimension_constants.dart';
import 'package:new_app/representation/widgets/app_bar_container_widget.dart';
import 'package:new_app/representation/widgets/button_widget.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

// ignore: must_be_immutable
class SelectDateScreen extends StatelessWidget {
  SelectDateScreen({super.key});

  static const String routeName = '/select_date_screen';

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidge(
      titleString: 'Select date',
      child: Column(
        children: [
          const SizedBox(
            height: kMediumPadding * 2,
          ),
          SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            monthViewSettings: const DateRangePickerMonthViewSettings(
              firstDayOfWeek: 1,
            ),
            selectionColor: ColorPalette.yellowColor,
            startRangeSelectionColor: ColorPalette.yellowColor,
            endRangeSelectionColor: ColorPalette.yellowColor,
            rangeSelectionColor: ColorPalette.yellowColor.withOpacity(0.25),
            toggleDaySelection: true,
            todayHighlightColor: ColorPalette.yellowColor,
            enablePastDates: false,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              if (args.value is PickerDateRange) {
                rangeStartDate = args.value.startDate;
                rangeEndDate = args.value.endDate;
              }
            },
          ),
          ButtonWidget(
            title: 'Select',
            ontap: () {
              Navigator.of(context).pop([rangeStartDate, rangeEndDate]);
            },
          ),
          const SizedBox(
            height: kMediumPadding,
          ),
          ButtonWidget(
            title: 'Cancel',
            color: ColorPalette.primaryColor.withOpacity(0.1),
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
