import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:subzero_mobile/core/models/failure.dart';
import 'package:subzero_mobile/core/services/api.dart';
import 'package:subzero_mobile/core/services/hive_service.dart';
import 'package:subzero_mobile/core/services/notification_service.dart';
import 'package:subzero_mobile/features/auth/data/models/user_model.dart';
import 'package:subzero_mobile/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  @override
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
    required String lang,
  }) async {
    try {
      final String? token = await NotificationService.token;
      final Response response = await API.instance.get(APIData(
        url: '/users/login',
        body: {
          "email": email,
          "password": password,
          "device_token": token,
          "lang": lang,
        },
      ));
      if (response.statusCode == 200) {
        final data = response.data['data'];
        final UserModel user = UserModel.fromJson(data);
        await HiveService.instance.storeUser(user);
        API.instance.authorize();
        return right(user);
      }
      return left(Failure.defaultMessage());
    } on DioException catch (ex) {
      return left(Failure.server(ex));
    } catch (ex) {
      return left(Failure.defaultMessage());
    }
  }
}
