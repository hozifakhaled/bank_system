import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/features/home/presentation/manegar/cubit/add_account_cubit.dart';
import 'package:bank_system/features/home/presentation/widgets/account_type_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChoiceAccountTypeViewBody extends StatelessWidget {
  const ChoiceAccountTypeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: BlocListener<AddAccountCubit, AddAccountState>(
            listener: (context, state) {
              if (state is AddAccountSuccessState) {
                if (state.account.accountType == 'current') {
                  GoRouter.of(context).go(Routes.home);
                } else if (state.account.accountType == 'islamic') {
                  GoRouter.of(context).go(Routes.onboarding);
                } else if (state.account.accountType == 'deposit') {
                  GoRouter.of(context).go(Routes.signupasEmplyer);
                }
              } else if (state is AddAccountErrorState) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: Column(
              children: [
                // Header Section with Welcome
                ClipPath(
                  clipper: TopCurveClipper(),
                  child: Container(
                    height: size.height * 0.35,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Welcome Section
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color(0xFF6366F1).withOpacity(0.1),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.account_balance_outlined,
                            size: isSmallScreen ? 40 : 50,
                            color: const Color(0xFF6366F1),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Welcome Back!',
                          style: TextStyle(
                            color: const Color(0xFF2D3748),
                            fontSize: isSmallScreen ? 26 : 32,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Ahmed Mohamed', // يمكن تغييرها للاسم الديناميكي
                          style: TextStyle(
                            color: const Color(0xFF6366F1),
                            fontSize: isSmallScreen ? 18 : 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Select Account Type',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: isSmallScreen ? 14 : 16,
                            fontWeight: FontWeight.w400,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const Spacer(flex: 1),

                // Account Type Cards
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Column(
                    children: [
                      AccountTypeCard(
                        emoji: '💳',
                        title: 'Current Account',
                        subtitle: 'For daily transactions and payments',
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        onTap: () {
                          context.read<AddAccountCubit>().addAccount('current');
                        },
                      ),
                      const SizedBox(height: 20),
                      AccountTypeCard(
                        emoji: '🕌',
                        title: 'Islamic Account',
                        subtitle: 'Sharia-compliant banking services',
                        gradient: const LinearGradient(
                          colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        onTap: () {
                          context.read<AddAccountCubit>().addAccount('islamic');
                        },
                      ),
                      const SizedBox(height: 20),
                      AccountTypeCard(
                        emoji: '💰',
                        title: 'Fixed Deposit',
                        subtitle: 'Save money with higher interest rates',
                        gradient: const LinearGradient(
                          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                        ),
                        onTap: () {
                          context.read<AddAccountCubit>().addAccount('Deposit');
                        },
                      ),
                    ],
                  ),
                ),

                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 80);

    // Create a smoother curve
    final firstControlPoint = Offset(size.width * 0.3, size.height - 20);
    final firstEndPoint = Offset(size.width * 0.5, size.height - 30);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    final secondControlPoint = Offset(size.width * 0.7, size.height - 40);
    final secondEndPoint = Offset(size.width, size.height - 80);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
