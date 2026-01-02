import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/features/profile/data/repo/profile_repo_impl.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit() : super(UpdatePasswordInitial());
  final TextEditingController passwordCon = TextEditingController();
  final TextEditingController newPasswordCon = TextEditingController();
  final TextEditingController confirmPasswordCon = TextEditingController();

  void updatePassword() async {
    await Future.delayed(Duration(microseconds: 0));
    emit(UpdatePasswordLoading());
    var result = await ProfileRepoImpl().updateProfile(
      oldPassword: passwordCon.text,
      newPassword: confirmPasswordCon.text,
    );
    result.fold(
      (failure) => emit(UpdatePasswordFailure(failure.message)),
      (user) => emit(UpdatePasswordSuccess()),
    );
  }
}
