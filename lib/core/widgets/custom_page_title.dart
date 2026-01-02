import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class CustomPageTitle extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool? canBack;
  const CustomPageTitle({
    super.key,
    required this.title,
    this.canBack,
  });

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
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (canBack ?? false)
              GestureDetector(
                onTap: () => context.router.pop(),
                child: Icon(Icons.arrow_back_ios_new),
              ),
            Expanded(
              child: Text(
                title,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                style: context.texts.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 50);
}
