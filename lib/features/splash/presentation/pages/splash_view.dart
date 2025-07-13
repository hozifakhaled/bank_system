import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/core/themeing/colors.dart';
import 'package:bank_system/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:bank_system/features/splash/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: BlocProvider(
        create: (context) => SplashCubit()..init(),
        child: BlocListener<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state is SplashLoaded) {
            GoRouter.of(context).push(Routes.onboarding);
            }
          },
          child: const SplashViewBody(),
        ),
      ),
    );
  }
}
