import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class ProfileViewHeader extends StatelessWidget implements PreferredSizeWidget {
  const ProfileViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profile".tr(),
              style: context.texts.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 80);
}
