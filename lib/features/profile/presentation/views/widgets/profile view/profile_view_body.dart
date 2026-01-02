import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/router/routes.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/home%20view/personal_card_widget.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/profile%20view/language_switcher_widget.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/profile%20view/logout_widget.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/profile%20view/profile_view_item.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        PersonalCardWidget(),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            spacing: 16,
            children: [
              LanguageSwitcherWidget(),
              ProfileViewItem(
                title: "PersonalInfo".tr(),
                route: Routes.updateProfileView,
              ),
              ProfileViewItem(
                title: "ChangePassword".tr(),
                route: Routes.changePasswordView,
              ),
              Divider(color: Colors.grey),
              ProfileViewItem(
                title: "AboutUs".tr(),
                route: Routes.aboutUsView,
              ),
              LogoutWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
