import 'package:bank_system/features/deposits/presentation/widgets/deposit_form_widget.dart';
import 'package:bank_system/features/deposits/presentation/widgets/deposit_header_widget.dart';
import 'package:bank_system/features/deposits/presentation/widgets/deposit_history_widget.dart';
import 'package:flutter/material.dart';

class BodyDepoistView extends StatelessWidget {
  const BodyDepoistView({
    super.key,
    required this.deposits,
  });

  final List<Map<String, String>> deposits;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DepositHeaderWidget(),
          DepositFormWidget(),
          DepositHistoryWidget(deposits: deposits),
        ],
      ),
    );
  }
}
