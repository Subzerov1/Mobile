import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/core/widgets/custom_button.dart';
import 'package:subzero_mobile/core/widgets/custom_snack_bar.dart';
import 'package:subzero_mobile/core/widgets/custom_text_field.dart';
import 'package:subzero_mobile/core/widgets/loading_dialog.dart';
import 'package:subzero_mobile/features/home/presentation/manager/main%20cubit/main_cubit.dart';
import 'package:subzero_mobile/features/profile/presentation/manager/update%20profile%20cubit/update_profile_cubit.dart';

class UpdateProfileViewBody extends StatefulWidget {
  const UpdateProfileViewBody({super.key});

  @override
  State<UpdateProfileViewBody> createState() => _UpdateProfileViewBodyState();
}

class _UpdateProfileViewBodyState extends State<UpdateProfileViewBody> {
  @override
  Widget build(BuildContext context) {
    final UpdateProfileCubit cubit = BlocProvider.of(context);
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileLoading) {
          context.dialog(LoadingDialog("SavingData".tr()));
        } else if (state is UpdateProfileSuccess) {
          context.router.pop();
          ShowCustomSnackBar(context).done(message: "DataSaved".tr());
          BlocProvider.of<MainCubit>(context).update();
          context.router.pop();
        } else if (state is UpdateProfileFailure) {
          context.router.pop();
          ShowCustomSnackBar(context).failure(message: state.message);
        }
      },
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 16,
          children: [
            GestureDetector(
              onTap: () async {
                await cubit.pickImage();
                setState(() {});
              },
              child: Container(
                width: 100,
                height: 100,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: cubit.image != null
                        ? FileImage(cubit.image!)
                        : NetworkImage(
                            cubit.user.imagePath ?? "",
                          ),
                  ),
                ),
                child: Container(
                  color: Colors.black.withAlpha(100),
                  child: Icon(Icons.edit, color: Colors.white),
                ),
              ),
            ),
            CustomTextField(
              controller: cubit.nameArCon,
              label: "Name(Ar)".tr(),
              hint: "Name(Ar)".tr(),
            ),
            CustomTextField(
              controller: cubit.nameEnCon,
              label: "Name(En)".tr(),
              hint: "Name(En)".tr(),
            ),
            CustomTextField(
              controller: cubit.jobTitleArCon,
              label: "JobTitle(Ar)".tr(),
              hint: "JobTitle(Ar)".tr(),
            ),
            CustomTextField(
              controller: cubit.jobTitleEnCon,
              label: "JobTitle(En)".tr(),
              hint: "JobTitle(En)".tr(),
            ),
            CustomButton(
              text: 'Save'.tr(),
              onPressed: () => cubit.updateProfileData(),
            ),
          ],
        ),
      ),
    );
  }
}
