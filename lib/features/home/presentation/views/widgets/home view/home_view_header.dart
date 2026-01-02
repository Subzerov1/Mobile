import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/router/routes.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/features/home/data/models/device_model.dart';
import 'package:subzero_mobile/features/home/presentation/manager/home%20cubit/home_cubit.dart';

class HomeViewHeader extends StatelessWidget implements PreferredSizeWidget {
  const HomeViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeCubit cubit = BlocProvider.of(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Home".tr(),
              style: context.texts.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () async {
                DeviceModel? device = await context.router.push(Routes.scannerView);
                if (device != null) cubit.addDevice(device);
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: context.colors.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.qr_code_scanner_sharp,
                  color: Colors.white,
                  size: 17,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.maxFinite, 80);
}
