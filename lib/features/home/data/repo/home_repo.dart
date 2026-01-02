import 'package:dartz/dartz.dart';
import 'package:subzero_mobile/core/models/failure.dart';
import 'package:subzero_mobile/features/home/data/models/device_model.dart';
import 'package:subzero_mobile/features/home/data/models/log_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<DeviceModel>>> fetchDevices();
  Future<Either<Failure, DeviceModel>> addNewDevice(String serialNumber);

  Future<Either<Failure, List<LogModel>>> fetchDeviceLogs({
    required int deviceId,
    required DateTime startDate,
    required DateTime endDate,
  });
}
