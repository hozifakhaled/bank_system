import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/features/home/presentation/manegar/add_account_cubit/add_account_cubit.dart';
import 'package:bank_system/features/home/presentation/widgets/choice_account_type_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoiceAccountType extends StatelessWidget {
  const ChoiceAccountType({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AddAccountCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: const ChoiceAccountTypeViewBody(),
      ),
    );
  }
}
