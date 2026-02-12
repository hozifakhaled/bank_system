import 'package:bank_system/features/withdraws/presentation/widgets/withdraw_form_widget.dart';
import 'package:bank_system/features/withdraws/presentation/widgets/withdraw_header_widget.dart';
import 'package:bank_system/features/withdraws/presentation/widgets/withdraw_history_widget.dart';
import 'package:flutter/material.dart';

class BodyWithdrawView extends StatelessWidget {
  const BodyWithdrawView({
    super.key,
    required this.balance,
    required this.withdrawals,
  });

  final double balance;
  final List<Map<String, String>> withdrawals;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WithdrawHeaderWidget(),
          WithdrawFormWidget(),
          WithdrawHistoryWidget(withdrawals: withdrawals),
        ],
      ),
    );
  }
}
