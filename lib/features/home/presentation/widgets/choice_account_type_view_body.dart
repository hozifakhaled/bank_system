import 'package:bank_system/features/home/presentation/widgets/account_type_container.dart';
import 'package:flutter/material.dart';

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
                        'Ahmed Mohamed',
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
                    ),
                   
                  ],
                ),
              ),
              const Spacer(flex: 2),
            ],
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
    path.quadraticBezierTo(size.width * 0.3, size.height - 20, size.width * 0.5, size.height - 30);
    path.quadraticBezierTo(size.width * 0.7, size.height - 40, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
