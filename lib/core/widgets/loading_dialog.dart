import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class LoadingDialog extends StatelessWidget {
  final String message;
  const LoadingDialog(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          children: [
            LottieBuilder.asset(
              'assets/loading.json',
              width: 100,
              height: 100,
              repeat: true,
              onLoaded: (value) {},
            ),
            Text(message),
          ],
        ),
      ),
    );
  }
}
