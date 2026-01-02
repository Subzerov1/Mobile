import 'package:dartz/dartz.dart' as z;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:subzero_mobile/core/models/failure.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/core/widgets/custom_snack_bar.dart';
import 'package:subzero_mobile/core/widgets/loading_dialog.dart';
import 'package:subzero_mobile/features/home/data/models/device_model.dart';
import 'package:subzero_mobile/features/home/data/repo/home_repo_impl.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({super.key});

  @override
  State<ScannerView> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> with SingleTickerProviderStateMixin {
  final MobileScannerController controller = MobileScannerController(
    autoStart: true,
    detectionSpeed: DetectionSpeed.noDuplicates,
  );
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Add new device", style: context.texts.titleLarge),
                  GestureDetector(
                    onTap: () => context.router.pop(),
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MobileScanner(
                controller: controller,
                onDetect: (capture) async {
                  final Barcode barcode = capture.barcodes.first;
                  final String serialNumber = barcode.rawValue ?? "";
                  if (serialNumber.isNotEmpty) {
                    await controller.stop();
                    DeviceModel? device;
                    if (context.mounted) context.dialog(LoadingDialog("SavingData".tr()));
                    var result = await HomeRepoImpl().addNewDevice(serialNumber);
                    if (context.mounted) context.router.pop();
                    if (result.isRight()) {
                      device = (result as z.Right).value;
                    } else if (result.isLeft() && context.mounted) {
                      ShowCustomSnackBar(context).failure(
                        message: ((result as z.Left).value as Failure).message,
                      );
                    }
                    if (context.mounted) context.router.pop(device);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
