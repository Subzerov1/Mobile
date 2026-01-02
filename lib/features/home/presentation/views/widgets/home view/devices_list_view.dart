import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/widgets/custom_snack_bar.dart';
import 'package:subzero_mobile/core/widgets/loading_handler.dart';
import 'package:subzero_mobile/features/home/presentation/manager/home%20cubit/home_cubit.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/home%20view/device_item.dart';

class DevicesListView extends StatelessWidget {
  const DevicesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is FetchDevicesFailure) {
          ShowCustomSnackBar(context).failure(message: state.message);
        }
      },
      builder: (context, state) {
        if (state is FetchDevicesLoading) {
          return LoadingList();
        } else if (state is FetchDevicesFailure) {
          return Center(child: Text("NoDevicesFound".tr()));
        } else if (state is FetchDevicesSuccess && state.devices.isEmpty) {
          return Center(child: Text("NoDevicesFound".tr()));
        } else if (state is FetchDevicesSuccess) {
          return ListView.builder(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 50),
            itemCount: state.devices.length,
            itemBuilder: (context, index) => DeviceItem(state.devices[index]),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
