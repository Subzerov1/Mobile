import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/widgets/custom_snack_bar.dart';
import 'package:subzero_mobile/core/widgets/loading_handler.dart';
import 'package:subzero_mobile/features/home/presentation/manager/device%20cubit/device_cubit.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/device%20view/logs_item.dart';

class LogsListView extends StatelessWidget {
  const LogsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeviceCubit, DeviceState>(
      listener: (context, state) {
        if (state is FetchDataFailure) {
          ShowCustomSnackBar(context).failure(message: state.message);
        }
      },
      builder: (context, state) {
        if (state is FetchDataLoading) {
          return LoadingList();
        } else if (state is FetchDataFailure) {
          return Center(child: Text("NoDataAvailable".tr()));
        } else if (state is FetchDataSuccess && state.logs.isEmpty) {
          return Center(child: Text("NoDataAvailable".tr()));
        } else if (state is FetchDataSuccess && state.logs.isNotEmpty) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemCount: state.logs.length,
            itemBuilder: (context, index) => LogsItem(state.logs[index]),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
