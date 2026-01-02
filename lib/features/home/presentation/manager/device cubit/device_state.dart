part of 'device_cubit.dart';

@immutable
sealed class DeviceState {}

final class DeviceInitial extends DeviceState {}

final class FetchDataLoading extends DeviceState {}

final class FetchDataSuccess extends DeviceState {
  final List<LogModel> logs;

  FetchDataSuccess(this.logs);
}

final class FetchDataFailure extends DeviceState {
  final String message;
  FetchDataFailure(this.message);
}
