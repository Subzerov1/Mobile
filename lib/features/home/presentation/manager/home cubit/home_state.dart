part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class FetchDevicesLoading extends HomeState {}

final class FetchDevicesSuccess extends HomeState {
  final List<DeviceModel> devices;

  FetchDevicesSuccess(this.devices);
}

final class FetchDevicesFailure extends HomeState {
  final String message;
  FetchDevicesFailure(this.message);
}
