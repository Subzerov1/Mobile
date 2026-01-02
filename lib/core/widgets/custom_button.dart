import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool? isLoading;
  final Color? backgroundColor;
  final double? width;
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.backgroundColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading! ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? context.colors.primary,
        foregroundColor: context.colors.onPrimary,
        fixedSize: Size(width ?? double.maxFinite, 30),
        disabledBackgroundColor: context.colors.primary.withAlpha(128),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: isLoading!
          ? SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(color: Colors.white),
            )
          : Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }
}
