import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/features/profile/data/repo/profile_repo_impl.dart';

class SwitchLanguageAni extends StatelessWidget {
  final String language;
  const SwitchLanguageAni(this.language, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/Translate language.json',
          width: 150,
          height: 150,
          onLoaded: (animation) async {
            await Future.delayed(animation.duration);
            await ProfileRepoImpl().updateProfile(language: language);
            if (context.mounted) context.router.pop();
          },
        ),
      ),
    );
  }
}
