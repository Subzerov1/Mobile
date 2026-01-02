import 'package:flutter/material.dart';
import 'package:subzero_mobile/core/router/routes.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/features/home/data/models/device_model.dart';

class DeviceItem extends StatelessWidget {
  final DeviceModel device;
  const DeviceItem(this.device, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.router.push(Routes.deviceView, extra: device),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: EdgeInsets.only(bottom: 16),
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            right: BorderSide(color: device.statusColor, width: 7),
          ),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5,
                children: [
                  Expanded(
                    child: Text(
                      device.organizationName,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: context.texts.titleMedium,
                    ),
                  ),
                  Text(
                    device.serialNumber,
                    style: context.texts.titleMedium!.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset('assets/medical.png', height: 50)
          ],
        ),
      ),
    );
  }
}
