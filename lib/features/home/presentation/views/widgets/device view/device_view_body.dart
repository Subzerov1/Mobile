import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/core/widgets/date_range_bottom_sheet.dart';
import 'package:subzero_mobile/features/home/presentation/manager/device%20cubit/device_cubit.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/device%20view/device_header_item.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/device%20view/logs_list_view.dart';

class DeviceViewBody extends StatelessWidget {
  const DeviceViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final DeviceCubit cubit = BlocProvider.of(context);
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  DeviceHeaderItem(
                    title: "ReferenceNumber".tr(),
                    subtitle: cubit.device.serialNumber,
                  ),
                  DeviceHeaderItem(
                    title: "SoftwareVersion".tr(),
                    subtitle: cubit.device.softwareRelease,
                  ),
                  DeviceHeaderItem(
                    title: "FirstLaunch".tr(),
                    subtitle: cubit.device.firstLaunch?.formate(context.lang) ?? "",
                  ),
                  DeviceHeaderItem(
                    title: "LogsLength".tr(),
                    subtitle: cubit.device.historyLength,
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Text(
                  "Logs".tr(),
                  style: context.texts.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => DateRangeBottomSheet(
                        onChanged: (value) {
                          cubit.startDate = value.startDate;
                          cubit.endDate = value.endDate;
                          cubit.fetchData();
                        },
                        startDate: cubit.startDate ?? cubit.initialStartDate,
                        endDate: cubit.endDate ?? cubit.initialEndDate,
                      ),
                    );
                  },
                  child: Icon(
                    Icons.settings,
                    color: (cubit.startDate != null || cubit.endDate != null)
                        ? context.colors.primary
                        : Colors.grey,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          Expanded(child: LogsListView()),
        ],
      ),
    );
  }
}
