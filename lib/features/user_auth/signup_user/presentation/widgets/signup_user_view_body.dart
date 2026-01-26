import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/signp_button.dart';
import 'package:bank_system/features/user_auth/signup_user/presentation/widgets/user_data.dart';
import 'package:flutter/material.dart';

class SignupUserViewBody extends StatelessWidget {
  const SignupUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserData(),
              SignupButton(),
            ],
          ),
        ),
    
    );
  }
}