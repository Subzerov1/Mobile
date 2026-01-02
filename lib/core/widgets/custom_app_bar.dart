import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: Colors.grey.shade300,
          )),
        ),
        child: Row(
          children: [
            Text(
              "Subzero",
              style: context.texts.titleLarge,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
