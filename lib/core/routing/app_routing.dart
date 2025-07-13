import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/features/home/presentation/pages/choice_account_type.dart';
import 'package:bank_system/features/home/presentation/pages/home_current_view.dart';
import 'package:bank_system/features/onboarding/presentation/pages/welcome_view.dart';
import 'package:bank_system/features/splash/presentation/pages/splash_view.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/cubit/signup_user_cubit.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/pages/choice_user.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/pages/signup_user_view.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/signup_emplyer_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    initialLocation:
        Routes.splah, 
    routes: <GoRoute>[
      GoRoute(
        path: Routes.splah,
        builder: (context, state) => const HomeCurrentView(),
      ),

      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const WelcomeView(),
      ),

      GoRoute(
        path: Routes.signupasuser,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<SignupUserCubit>(),
          child: const SignupUserView(),
        ),
      ),
        GoRoute(
        path: Routes.signupasEmplyer,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<SignupUserCubit>(),
          child: const SignupEmployeeViewBody(),
        ),
      ),
      GoRoute(
        path: Routes.choiceaccounttype,
        builder: (context, state) => const ChoiceAccountType(),
      ),
      GoRoute(path: Routes.choiceuser, builder: (context, state) => const ChoiceUser()),
    ],
  );
}
