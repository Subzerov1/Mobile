import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/features/auth/presentation/manager/login%20cubit/login_cubit.dart';
import 'package:subzero_mobile/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: SafeArea(child: LoginViewBody()),
      ),
    );
  }
}
