import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/core/widgets/custom_navbar.dart';
import 'package:bank_system/features/deposits/presentation/pages/deposit_view.dart';
import 'package:bank_system/features/fixeddeposits/persentation/pages/fixed_deposit_home_page.dart';
import 'package:bank_system/features/home/data/model/deposit_model.dart';
import 'package:bank_system/features/home/domain/entites/deposit_entity.dart';
import 'package:bank_system/features/home/presentation/pages/balane_view.dart';
import 'package:bank_system/features/home/presentation/pages/choice_account_type.dart';
import 'package:bank_system/features/home/presentation/pages/home_current_view.dart';
import 'package:bank_system/features/home/presentation/widgets/account_overview.dart';
import 'package:bank_system/features/home/presentation/widgets/show_deposit_and_withdraw_data.dart';
import 'package:bank_system/features/onboarding/presentation/pages/welcome_view.dart';
import 'package:bank_system/features/splash/presentation/pages/splash_view.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/cubit/signup_user_cubit.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/pages/choice_user.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/pages/signup_user_view.dart';
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
      GoRoute(path: Routes.accountOverview, builder: (context, state) => const AccountOverviewPage()),
      GoRoute(path: Routes.navbar, builder: (context, state) => const CustomNavbar()),
      GoRoute(path: Routes.tranfer, builder: (context, state) => const TransferView()),
      GoRoute(path: Routes.profile, builder: (context, state) =>  ProfilePage()),
      GoRoute(path: Routes.fixeddeposit, builder: (context, state) =>  const FixedDepositHomePage()),
      GoRoute(path: Routes.deposit, builder: (context, state) =>  const DepositHomePage()),
      GoRoute(path: Routes.withdraw, builder: (context, state) =>  const WithdrawHomePage()),
      GoRoute(path: Routes.islamicaccount, builder: (context, state) =>  const IslamicAccountHomePage()),
    ],
  );
}
