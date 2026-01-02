import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:subzero_mobile/core/models/failure.dart';
import 'package:subzero_mobile/features/auth/data/models/user_model.dart';

abstract class ProfileRepo {
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
  });
}
