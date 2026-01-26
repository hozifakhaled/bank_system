import 'package:bank_system/features/onboarding/presentation/widgets/welcome_view_body.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  WelcomeViewBody(),
      ),
    );
  }
}