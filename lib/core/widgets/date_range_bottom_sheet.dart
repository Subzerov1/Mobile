import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/core/widgets/custom_button.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangeBottomSheet extends StatelessWidget {
  final DateTime startDate;
  final DateTime endDate;
  final Function(PickerDateRange value) onChanged;
  const DateRangeBottomSheet({
    super.key,
    required this.onChanged,
    required this.startDate,
    required this.endDate,
  });

  @override
  Widget build(BuildContext context) {
    PickerDateRange? selectedRange;
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "LogsFilter".tr(),
                style: context.texts.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () => context.router.pop(),
                child: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(height: 16),
          Expanded(
            flex: 4,
            child: SfDateRangePicker(
              backgroundColor: Colors.white,
              headerStyle: DateRangePickerHeaderStyle(
                backgroundColor: Colors.white,
              ),
              selectionMode: DateRangePickerSelectionMode.extendableRange,
              initialSelectedRange: PickerDateRange(startDate, endDate),
              onSelectionChanged: (range) {
                if (range.value != null && (range.value is PickerDateRange)) {
                  selectedRange = range.value;
                }
              },
            ),
          ),
          CustomButton(
            text: "Done".tr(),
            onPressed: () {
              if (selectedRange != null) {
                onChanged(selectedRange!);
              }
              context.router.pop();
            },
          ),
        ],
      ),
    );
  }
}
