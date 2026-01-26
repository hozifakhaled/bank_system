import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/features/home/data/model/deposit_model.dart';
import 'package:bank_system/features/home/presentation/manegar/cubit/add_pdf_cubit.dart';
import 'package:bank_system/features/home/presentation/pages/balane_view.dart';
import 'package:bank_system/features/home/presentation/pages/choice_account_type.dart';
import 'package:bank_system/features/home/presentation/pages/home_current_view.dart';
import 'package:bank_system/features/home/presentation/widgets/show_deposit_and_withdraw_data.dart';
import 'package:bank_system/features/onboarding/presentation/screens/welcome_screen.dart';
import 'package:bank_system/features/splash/presentation/screens/splash_screen.dart';
import 'package:bank_system/features/user_auth/login_user/presentation/pages/login_screen.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/cubit/signup_user_cubit.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/screens/choice_user_screen.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/screens/signup_user_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
  static final GoRouter router = GoRouter(
    initialLocation:
        Routes.splah,
    routes: <GoRoute>[
      GoRoute(
        path: Routes.splah,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const WelcomeScreen(),
      ),

      GoRoute(
        path: Routes.signupasuser,
        builder: (context, state) => BlocProvider(
          create: (context) => sl<SignupUserCubit>(),
          child: const SignupUserScreen(),
        ),
      ),
      GoRoute(
        path: Routes.choiceaccounttype,
        builder: (context, state) => const ChoiceAccountType(),
      ),
       GoRoute(
        path: Routes.dataDepositAndWithdraw,
        builder: (context, state) =>  BlocProvider(
          create: (context) => sl<AddPdfCubit>(),
          child: ShowDepositAndWithdrawData(deposit: state.extra as DepositModel,),
        ),
      ),
        GoRoute(
        path: Routes.login,
        builder: (context, state) => LoginScreen(),
       
      ),
       GoRoute(
        path: Routes.balance,
        builder: (context, state) => BalanceView (),
      ),
      GoRoute(path: Routes.choiceuser, builder: (context, state) => const ChoiceUserScreen()),
      GoRoute(
        path: Routes.home,
        builder: (context, state) => const HomeCurrentView(),
      ),
    ],
  );
}
