import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final String? label;
  final TextEditingController? controller;
  final IconData? suffix;
  final Function()? onSuffixPressed;
  final bool? obscureText;
  final String? Function(String? value)? validator;
  const CustomTextField({
    super.key,
    required this.hint,
    this.label,
    this.suffix,
    this.obscureText = false,
    this.onSuffixPressed,
    this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Text(
            label!,
            style: context.texts.titleSmall!.copyWith(fontWeight: FontWeight.bold),
          ),
        TextFormField(
          controller: controller,
          obscureText: obscureText!,
          validator: validator,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Colors.grey),
            contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black54),
            ),
            suffixIcon: suffix != null
                ? GestureDetector(
                    onTap: onSuffixPressed,
                    child: Icon(suffix, size: 20, color: Colors.black54),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
