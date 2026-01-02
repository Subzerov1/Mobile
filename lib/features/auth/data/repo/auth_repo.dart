import 'package:dartz/dartz.dart';
import 'package:subzero_mobile/core/models/failure.dart';
import 'package:subzero_mobile/features/auth/data/models/user_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
    required String lang,
  });
}
