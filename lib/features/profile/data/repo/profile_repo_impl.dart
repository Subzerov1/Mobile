import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:subzero_mobile/core/models/failure.dart';
import 'package:subzero_mobile/core/services/api.dart';
import 'package:subzero_mobile/core/services/hive_service.dart';
import 'package:subzero_mobile/features/auth/data/models/user_model.dart';
import 'package:subzero_mobile/features/profile/data/repo/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  @override
  Future<Either<Failure, UserModel>> updateProfile({
    String? nameAr,
    String? nameEn,
    String? language,
    String? jobTitleAr,
    String? jobTitleEn,
    String? oldPassword,
    String? newPassword,
    String? deviceToken,
    File? image,
  }) async {
    try {
      Map<String, dynamic> data = {};
      if (nameAr?.isNotEmpty ?? false) data['name_ar'] = nameAr;
      if (nameEn?.isNotEmpty ?? false) data['name_en'] = nameEn;
      if (language?.isNotEmpty ?? false) data['lang'] = language;
      if (jobTitleAr?.isNotEmpty ?? false) data['job_title_ar'] = jobTitleAr;
      if (jobTitleEn?.isNotEmpty ?? false) data['job_title_en'] = jobTitleEn;
      if (oldPassword?.isNotEmpty ?? false) data['old_password'] = oldPassword;
      if (newPassword?.isNotEmpty ?? false) data['password'] = newPassword;
      if (deviceToken?.isNotEmpty ?? false) data['device_token'] = deviceToken;
      if (image != null) {
        data['image'] = await MultipartFile.fromFile(
          image.path,
          filename: image.path.split('/').last,
        );
      }
      if (data.isEmpty) return left(Failure(message: 'NoDataToUpdate'.tr()));
      final Response response = await API.instance.form(APIData(
        url: '/users/update',
        form: FormData.fromMap(data),
      ));
      if (response.statusCode == 200) {
        var data = response.data['data'];
        data['access_token'] = HiveService.instance.user?.accessToken;
        final UserModel user = UserModel.fromJson(data);
        print(HiveService.instance.user?.box);
        await HiveService.instance.user!.update(user);
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
