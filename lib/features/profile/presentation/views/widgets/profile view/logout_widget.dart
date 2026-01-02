import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/router/routes.dart';
import 'package:subzero_mobile/core/services/hive_service.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/core/widgets/loading_dialog.dart';
import 'package:subzero_mobile/features/profile/presentation/views/widgets/profile%20view/logout_dialog.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        bool? result = await context.dialog(LogoutDialog());
        if ((result ?? false)) {
          if (!context.mounted) return;
          context.dialog(LoadingDialog("PleaseWaitToLogout".tr()));
          await HiveService.instance.user!.delete();
          if (!context.mounted) return;
          context.router.pop(); // to close loading dialog
          context.router.go(Routes.loginView);
        }
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration:
            BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5), boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 5,
          )
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Logout".tr(),
              style: context.texts.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            Icon(
              Icons.logout_rounded,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
