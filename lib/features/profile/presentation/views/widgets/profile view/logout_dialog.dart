import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/core/widgets/custom_button.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Warning".tr(), style: context.texts.titleMedium),
                GestureDetector(
                  onTap: () => context.router.pop(),
                  child: Icon(Icons.close),
                ),
              ],
            ),
            Text("AreYouSureLogout".tr()),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton(
                  text: 'Yes'.tr(),
                  width: 80,
                  backgroundColor: Colors.red,
                  onPressed: () => context.router.pop(true),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
