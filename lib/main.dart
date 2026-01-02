import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/router/app_router.dart';
import 'package:subzero_mobile/core/services/api.dart';
import 'package:subzero_mobile/core/services/hive_service.dart';
import 'package:subzero_mobile/core/services/notification_service.dart';
import 'package:subzero_mobile/core/themes/light_theme.dart';
import 'package:subzero_mobile/features/home/presentation/manager/main%20cubit/main_cubit.dart';
import 'package:subzero_mobile/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await EasyLocalization.ensureInitialized();
  await NotificationService.instance.init();
  await HiveService.instance.init();
  API.instance.init();
  runApp(EasyLocalization(
    supportedLocales: [Locale('en'), Locale('ar')],
    path: 'assets/translations',
    startLocale: Locale('ar'),
    fallbackLocale: Locale('en'),
    child: const Subzero(),
  ));
}

class Subzero extends StatelessWidget {
  const Subzero({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: BlocBuilder<MainCubit, MainState>(
        buildWhen: (previous, current) => current is MainUpdate,
        builder: (context, state) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            themeMode: ThemeMode.light,
            theme: LightTheme.data,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
          );
        },
      ),
    );
  }
}
