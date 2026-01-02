import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/core/widgets/custom_button.dart';
import 'package:subzero_mobile/core/widgets/custom_snack_bar.dart';
import 'package:subzero_mobile/core/widgets/custom_text_field.dart';
import 'package:subzero_mobile/core/widgets/loading_dialog.dart';
import 'package:subzero_mobile/features/profile/presentation/manager/update%20password%20cubit/update_password_cubit.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey();
    final UpdatePasswordCubit cubit = BlocProvider.of(context);
    return BlocListener<UpdatePasswordCubit, UpdatePasswordState>(
      listener: (context, state) {
        if (state is UpdatePasswordLoading) {
          context.dialog(LoadingDialog("SavingData".tr()));
        } else if (state is UpdatePasswordSuccess) {
          context.router.pop();
          ShowCustomSnackBar(context).done(message: "DataSaved".tr());
          context.router.pop();
        } else if (state is UpdatePasswordFailure) {
          context.router.pop();
          ShowCustomSnackBar(context).failure(message: state.message);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            spacing: 16,
            children: [
              CustomTextField(
                controller: cubit.passwordCon,
                label: "CurrentPassword".tr(),
                hint: "CurrentPassword".tr(),
                validator: (value) {
                  if (value?.isEmpty ?? true) return "FieldRequired".tr();
                  return null;
                },
              ),
              CustomTextField(
                controller: cubit.newPasswordCon,
                label: "NewPassword".tr(),
                hint: "NewPassword".tr(),
                validator: (value) {
                  if (value?.isEmpty ?? true) return "FieldRequired".tr();
                  return null;
                },
              ),
              CustomTextField(
                controller: cubit.confirmPasswordCon,
                label: "ConfirmNewPassword".tr(),
                hint: "ConfirmNewPassword".tr(),
                validator: (value) {
                  if (value?.isEmpty ?? true) return "FieldRequired".tr();
                  if (cubit.newPasswordCon.text != cubit.confirmPasswordCon.text) {
                    return "PasswordNotMatch".tr();
                  }
                  return null;
                },
              ),
              CustomButton(
                text: 'Save'.tr(),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    cubit.updatePassword();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
