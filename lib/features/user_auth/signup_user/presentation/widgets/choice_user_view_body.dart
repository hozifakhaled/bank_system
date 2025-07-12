import 'package:bank_system/core/routing/routes.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/role_card.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/top_curve_cliper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChoiceUserViewBody extends StatelessWidget {
  const ChoiceUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.height < 700;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
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
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF6366F1).withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.account_circle_outlined,
                        size: isSmallScreen ? 40 : 50,
                        color: const Color(0xFF6366F1),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Choose Your Role',
                      style: TextStyle(
                        color: const Color(0xFF2D3748),
                        fontSize: isSmallScreen ? 23 : 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Please select your account type to continue.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: isSmallScreen ? 12 : 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                children: [
                  RoleCard(
                    icon: Icons.person_outline,
                    title: 'User',
                    subtitle: 'For individual banking services',
                    gradient: const LinearGradient(
                      colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () {
                     GoRouter.of(context).push(Routes.signupasuser);
                    },
                  ),
                  const SizedBox(height: 24),
                  RoleCard(
                    icon: Icons.business_center_outlined,
                    title: 'Employer',
                    subtitle: 'For employee or company access',
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8B5CF6), Color(0xFF6366F1)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    onTap: () {
                       GoRouter.of(context).push(Routes.signupasEmplyer);
                    },
                  ),
                ],
              ),
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}


