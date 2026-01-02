import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/features/home/data/models/device_model.dart';
import 'package:subzero_mobile/features/home/data/models/log_model.dart';
import 'package:subzero_mobile/features/home/data/repo/home_repo_impl.dart';

part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  final DeviceModel device;
  late DateTime initialStartDate;
  late DateTime initialEndDate;
  DeviceCubit(this.device) : super(DeviceInitial()) {
    if (device.lastUpdate != null) {
      initialStartDate = device.lastUpdate!.copyWith(month: 1, day: 1);
      initialEndDate = device.lastUpdate!.copyWith(month: 12, day: 31);
    } else {
      initialStartDate = DateTime(now.year, now.month, 0);
      initialEndDate = DateTime(now.year, now.month + 1, 0);
    }
  }
  final DateTime now = DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  void fetchData() async {
    await Future.delayed(Duration(microseconds: 0));
    emit(FetchDataLoading());

    var result = await HomeRepoImpl().fetchDeviceLogs(
      deviceId: device.id,
      startDate: startDate ?? initialStartDate,
      endDate: endDate ?? initialEndDate,
    );
    result.fold(
      (failure) => emit(FetchDataFailure(failure.message)),
      (logs) => emit(FetchDataSuccess(logs)),
    );
  }
}
