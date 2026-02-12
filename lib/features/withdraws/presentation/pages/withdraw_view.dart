import 'package:bank_system/core/di/getit.dart';
import 'package:bank_system/core/widgets/custom_navbar.dart';
import 'package:bank_system/features/withdraws/presentation/manger/cubit/withdraw_cubit.dart';
import 'package:bank_system/features/withdraws/presentation/widgets/body_withdraw_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WithdrawHomePage extends StatelessWidget {
  WithdrawHomePage({super.key});
  double balance = 5000.0;

  List<Map<String, String>> withdrawals = [
    {'amount': '200', 'date': 'Jan 1, 2026', 'method': 'Current Account'},
    {'amount': '150', 'date': 'Jan 10, 2026', 'method': 'Cash'},
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value:  sl<WithdrawCubit>()..getBalance(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF9FAFB),
        appBar: AppBar(
          backgroundColor: maincolor,
          title: const Text(
            'Withdraw',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: BodyWithdrawView(balance: balance, withdrawals: withdrawals),
      ),
    );
  }
}

