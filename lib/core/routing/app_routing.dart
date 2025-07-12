import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/features/onboarding/presentation/pages/welcome_view.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/pages/signup_user_view.dart';
import 'package:go_router/go_router.dart';



class AppRouting {
  static final GoRouter router = GoRouter(
    initialLocation:
        Routes.splah, // التأكد أن initialLocation يطابق Route موجود
    routes: <GoRoute>[
 
      GoRoute(
        path: Routes.splah,
        builder: (context, state) => const WelcomeView(),
      ),
      
      GoRoute(path: Routes.signupasuser, builder: (context, state) => const SignupUserView()),
    ],
  );
}
