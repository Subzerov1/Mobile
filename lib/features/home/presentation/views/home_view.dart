import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/features/home/presentation/manager/home%20cubit/home_cubit.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/home%20view/home_view_body.dart';
import 'package:subzero_mobile/features/home/presentation/views/widgets/home%20view/home_view_header.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchDevices(),
      child: Scaffold(
        appBar: HomeViewHeader(),
        body: HomeViewBody(),
      ),
    );
  }
}
