import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:subzero_mobile/core/router/app_router.dart';
import 'package:subzero_mobile/core/router/routes.dart';
import 'package:subzero_mobile/core/services/hive_service.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Center(
            child: LottieBuilder.asset(
              'assets/loading.json',
              width: 150,
              height: 150,
              repeat: true,
              onLoaded: (value) {
                Future.delayed(value.duration * 3).whenComplete(() {
                  if (HiveService.instance.user == null) {
                    AppRouter.router.go(Routes.loginView);
                  } else {
                    AppRouter.router.go(Routes.homeView);
                  }
                });
              },
            ),
          ),
          Spacer(),
          Text(
            "Powered By Subzero team",
          ),
        ],
      ),
    );
  }
}
