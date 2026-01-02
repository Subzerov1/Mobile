import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/features/profile/presentation/views/switch_language_ani.dart';

class LanguageSwitcherWidget extends StatelessWidget {
  const LanguageSwitcherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          shape: RoundedRectangleBorder(),
          useRootNavigator: true,
          builder: (context) => LanguageBottomSheet(),
        );
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Language".tr(),
              style: context.texts.titleMedium!.copyWith(fontWeight: FontWeight.bold),
            ),
            Icon(Icons.language),
          ],
        ),
      ),
    );
  }
}

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.zero,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "SelectLanguage".tr(),
                style: context.texts.titleLarge!.copyWith(fontWeight: FontWeight.bold),
              ),
              GestureDetector(
                onTap: () => context.router.pop(),
                child: Icon(Icons.close),
              ),
            ],
          ),
          SizedBox(height: 20),
          LanguageItem(
            text: "English",
            onPressed: () {
              if (context.lang == "en") return;
              Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
                if (context.mounted) context.setLocale(Locale('en'));
              });
              context.dialog(SwitchLanguageAni('en')).whenComplete(() {
                if (context.mounted) context.router.pop();
              });
            },
          ),
          SizedBox(height: 16),
          LanguageItem(
            text: "العربيه",
            onPressed: () {
              if (context.lang == "ar") return;

              Future.delayed(Duration(milliseconds: 500)).whenComplete(() {
                if (context.mounted) context.setLocale(Locale('ar'));
              });
              context.dialog(SwitchLanguageAni('ar')).whenComplete(() {
                if (context.mounted) context.router.pop();
              });
            },
          ),
        ],
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const LanguageItem({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(16),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: context.colors.primary.withAlpha(128),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: context.texts.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
