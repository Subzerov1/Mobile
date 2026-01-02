import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/widgets/custom_page_title.dart';
import 'package:subzero_mobile/features/home/data/models/device_model.dart';
import 'package:subzero_mobile/features/home/presentation/manager/device%20cubit/device_cubit.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/device%20view/device_view_body.dart';

class DeviceView extends StatelessWidget {
  final DeviceModel device;
  const DeviceView(this.device, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeviceCubit(device)..fetchData(),
      child: Scaffold(
        appBar: CustomPageTitle(
          title: device.organizationName,
          canBack: true,
        ),
        body: DeviceViewBody(),
      ),
    );
  }
}
