import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/features/profile/presentation/manager/update%20password%20cubit/update_password_cubit.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/change%20password%20view/change_password_view_body.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/change%20password%20view/change_password_view_header.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePasswordCubit(),
      child: Scaffold(
        appBar: ChangePasswordViewHeader(),
        body: ChangePasswordViewBody(),
      ),
    );
  }
}
