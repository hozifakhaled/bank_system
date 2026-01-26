import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/choice_user_view_body.dart';
import 'package:flutter/material.dart';

class ChoiceUserScreen extends StatelessWidget {
  const ChoiceUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: const ChoiceUserViewBody(),
    );
  }
}