import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:subzero_mobile/core/router/routes.dart';
import 'package:subzero_mobile/features/auth/presentation/views/login_view.dart';
import 'package:subzero_mobile/features/home/data/models/device_model.dart';
import 'package:subzero_mobile/features/home/presentation/views/device_view.dart';
import 'package:subzero_mobile/features/home/presentation/views/home_view.dart';
import 'package:subzero_mobile/features/home/presentation/views/scanner_view.dart';
import 'package:subzero_mobile/features/layout/presentation/views/layout_view.dart';
import 'package:subzero_mobile/features/profile/presentation/views/about_us_view.dart';
import 'package:subzero_mobile/features/profile/presentation/views/change_password_view.dart';
import 'package:subzero_mobile/features/profile/presentation/views/profile_view.dart';
import 'package:subzero_mobile/features/profile/presentation/views/update_profile_view.dart';
import 'package:subzero_mobile/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.splashView,
    routes: [
      ShellRoute(
        builder: (context, state, child) => LayoutView(child),
        routes: [
          GoRoute(
            path: Routes.homeView,
            pageBuilder: (context, state) => NoTransitionPage(child: HomeView()),
          ),
          GoRoute(
            path: Routes.profileView,
            pageBuilder: (context, state) => NoTransitionPage(
              child: ProfileView(
                key: ValueKey(context.locale.languageCode),
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        path: Routes.scannerView,
        builder: (context, state) => ScannerView(),
      ),
      GoRoute(
        path: Routes.splashView,
        builder: (context, state) => SplashView(),
      ),
      GoRoute(
        path: Routes.loginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: Routes.deviceView,
        builder: (context, state) => DeviceView(state.extra as DeviceModel),
      ),
      GoRoute(
        path: Routes.updateProfileView,
        builder: (context, state) => UpdateProfileView(),
      ),
      GoRoute(
        path: Routes.switchLanguageAni,
        builder: (context, state) => UpdateProfileView(),
      ),
      GoRoute(
        path: Routes.changePasswordView,
        builder: (context, state) => ChangePasswordView(),
      ),
      GoRoute(
        path: Routes.aboutUsView,
        builder: (context, state) => AboutUsView(),
      ),
    ],
  );
}
