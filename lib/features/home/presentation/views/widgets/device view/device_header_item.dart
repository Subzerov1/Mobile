import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/utils/extension.dart';

class DeviceHeaderItem extends StatelessWidget {
  final String title;
  final String subtitle;
  const DeviceHeaderItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final double size = (context.width - 42) / 2;
    return Container(
      width: size,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: context.colors.primary,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        spacing: 16,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: context.colors.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  color: context.colors.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
