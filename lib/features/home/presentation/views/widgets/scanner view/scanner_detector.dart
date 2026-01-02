import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class ScannerDetector extends StatelessWidget {
  const ScannerDetector({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.primary, width: 3),
      ),
    );
  }
}
