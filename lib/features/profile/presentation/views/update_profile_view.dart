import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/features/profile/presentation/manager/update%20profile%20cubit/update_profile_cubit.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/update%20profile%20view/update_profile_view_body.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/update%20profile%20view/update_profile_view_header.dart';

class UpdateProfileView extends StatelessWidget {
  const UpdateProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: Scaffold(
        appBar: UpdateProfileViewHeader(),
        body: UpdateProfileViewBody(),
      ),
    );
  }
}
