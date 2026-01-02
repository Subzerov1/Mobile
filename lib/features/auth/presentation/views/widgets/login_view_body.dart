import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:subzero_mobile/core/router/routes.dart';
import 'package:subzero_mobile/core/utils/extension.dart';
import 'package:subzero_mobile/core/widgets/custom_button.dart';
import 'package:subzero_mobile/core/widgets/custom_snack_bar.dart';
import 'package:subzero_mobile/core/widgets/custom_text_field.dart';
import 'package:subzero_mobile/features/auth/presentation/manager/login%20cubit/login_cubit.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailCon = TextEditingController();
  final TextEditingController passwordCon = TextEditingController();
  LoginCubit get cubit => BlocProvider.of(context);
  bool isLoading = false;
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          setState(() => isLoading = true);
        } else if (state is AuthFailure) {
          setState(() => isLoading = false);
          ShowCustomSnackBar(context).failure(message: state.message);
        } else if (state is AuthSuccess) {
          setState(() => isLoading = false);
          context.router.go(Routes.homeView);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Spacer(),
              Center(
                child: Text(
                  "WelcomeMessage".tr(),
                  style: context.texts.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                "EnterCredentials".tr(),
                style: context.texts.titleMedium!.copyWith(color: Colors.grey),
              ),
              SizedBox(height: 32),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 10,
                children: [
                  Container(width: 5, height: 40, color: context.colors.primary),
                  Text(
                    "Login".tr(),
                    style: context.texts.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: emailCon,
                validator: (value) {
                  if (value?.isEmpty ?? true) return "FieldRequired".tr();
                  return null;
                },
                hint: "EnterEmail".tr(),
                suffix: Icons.email,
              ),
              SizedBox(height: 16),
              CustomTextField(
                controller: passwordCon,
                hint: "EnterPassword".tr(),
                validator: (value) {
                  if (value?.isEmpty ?? true) return "FieldRequired".tr();
                  return null;
                },
                obscureText: !showPassword,
                suffix: Icons.visibility_off,
                onSuffixPressed: () => setState(() => showPassword = !showPassword),
              ),
              SizedBox(height: 16),
              CustomButton(
                text: "Login".tr(),
                isLoading: isLoading,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    cubit.login(
                      email: emailCon.text,
                      password: passwordCon.text,
                      lang: context.locale.languageCode,
                    );
                  }
                },
              ),
              Spacer(flex: 6),
            ],
          ),
        ),
      ),
    );
  }
}
