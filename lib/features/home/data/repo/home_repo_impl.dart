import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subzero_mobile/core/models/failure.dart';
import 'package:subzero_mobile/core/services/api.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/features/home/data/models/device_model.dart';
import 'package:subzero_mobile/features/home/data/models/log_model.dart';
import 'package:subzero_mobile/features/home/data/repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<Either<Failure, List<DeviceModel>>> fetchDevices() async {
    try {
      final Response response = await API.instance.get(APIData(
        url: '/devices/fetch',
      ));
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;
        final List<DeviceModel> devices = data.map((json) => DeviceModel.fromJson(json)).toList();
        return right(devices);
      }
      return left(Failure.defaultMessage());
    } on DioException catch (ex) {
      return left(Failure.server(ex));
    } catch (ex) {
      return left(Failure.defaultMessage());
    }
  }

  @override
  Future<Either<Failure, DeviceModel>> addNewDevice(String serialNumber) async {
    try {
      final Response response = await API.instance.post(APIData(
        url: '/devices/$serialNumber/add_to_user',
      ));
      if (response.statusCode == 200) {
        var data = response.data['data'];
        final DeviceModel device = DeviceModel.fromJson(data);
        return right(device);
      }
      return left(Failure.defaultMessage());
    } on DioException catch (ex) {
      return left(Failure.server(ex));
    } catch (ex) {
      return left(Failure.defaultMessage());
    }
  }

  @override
  Future<Either<Failure, List<LogModel>>> fetchDeviceLogs({
    required int deviceId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final Response response = await API.instance.get(APIData(
        url: '/devices/$deviceId/fetch/logs',
        body: {
          "start_date": startDate.server(),
          "end_date": endDate.server(),
        },
      ));
      if (response.statusCode == 200) {
        var data = response.data['data'] as List;
        final List<LogModel> logs = data.map((json) => LogModel.fromJson(json)).toList();
        return right(logs);
      }
      return left(Failure.defaultMessage());
    } on DioException catch (ex) {
      return left(Failure.server(ex));
    } catch (ex) {
      return left(Failure.defaultMessage());
    }
  }
}
