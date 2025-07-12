import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/signup_user_view_body.dart';
import 'package:flutter/material.dart';

class SignupUserView extends StatelessWidget {
  const SignupUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: const SignupUserViewBody(),
    );
  }
}