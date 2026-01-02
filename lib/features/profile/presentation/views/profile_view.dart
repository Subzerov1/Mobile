import 'package:flutter/material.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/profile%20view/profile_view_body.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/profile%20view/profile_view_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileViewHeader(),
      body: ProfileViewBody(),
    );
  }
}
