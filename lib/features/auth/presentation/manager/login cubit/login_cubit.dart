import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/features/auth/data/models/user_model.dart';
import 'package:subzero_mobile/features/auth/data/repo/auth_repo_impl.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void login({required String email, required String password, required String lang}) async {
    await Future.delayed(Duration(microseconds: 0));
    emit(AuthLoading());
    var result = await AuthRepoImpl().login(email: email, password: password, lang: lang);
    result.fold((failure) => emit(AuthFailure(failure.message)), (user) => emit(AuthSuccess(user)));
  }
}
