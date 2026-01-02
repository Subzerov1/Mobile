import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:subzero_mobile/core/services/hive_service.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/features/auth/data/models/user_model.dart';
import 'package:subzero_mobile/features/profile/data/repo/profile_repo_impl.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UserModel user = HiveService.instance.user!;
  final TextEditingController nameArCon = TextEditingController();
  final TextEditingController nameEnCon = TextEditingController();
  final TextEditingController jobTitleArCon = TextEditingController();
  final TextEditingController jobTitleEnCon = TextEditingController();
  File? image;
  UpdateProfileCubit() : super(UpdateProfileInitial()) {
    nameArCon.text = user.name.lang('ar');
    nameEnCon.text = user.name.lang('en');
    jobTitleArCon.text = user.jobTitle.lang('ar');
    jobTitleEnCon.text = user.jobTitle.lang('en');
  }

  void updateProfileData() async {
    await Future.delayed(Duration(microseconds: 0));
    emit(UpdateProfileLoading());
    var result = await ProfileRepoImpl().updateProfile(
      nameAr: nameArCon.text,
      nameEn: nameEnCon.text,
      jobTitleAr: jobTitleArCon.text,
      jobTitleEn: jobTitleEnCon.text,
      image: image,
    );
    result.fold(
      (failure) => emit(UpdateProfileFailure(failure.message)),
      (user) => emit(UpdateProfileSuccess()),
    );
  }

  Future pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) image = File(file.path);
  }
}
