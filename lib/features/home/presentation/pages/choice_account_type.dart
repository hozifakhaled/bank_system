import 'package:bank_system/features/home/presentation/widgets/choice_account_type_view_body.dart';
import 'package:flutter/material.dart';

class ChoiceAccountType extends StatelessWidget {
  const ChoiceAccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      body: const ChoiceAccountTypeViewBody(),
    );
  }
}