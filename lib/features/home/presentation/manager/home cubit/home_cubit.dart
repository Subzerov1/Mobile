import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/features/home/data/models/device_model.dart';
import 'package:subzero_mobile/features/home/data/repo/home_repo_impl.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<DeviceModel> devices = [];

  void fetchDevices() async {
    await Future.delayed(Duration(microseconds: 0));
    emit(FetchDevicesLoading());
    var result = await HomeRepoImpl().fetchDevices();
    result.fold(
      (failure) => emit(FetchDevicesFailure(failure.message)),
      (deviceList) {
        devices = deviceList;
        if (!isClosed) emit(FetchDevicesSuccess(devices));
      },
    );
  }

  void addDevice(DeviceModel device) {
    devices.add(device);
    if (!isClosed) emit(FetchDevicesSuccess(devices));
  }
}
