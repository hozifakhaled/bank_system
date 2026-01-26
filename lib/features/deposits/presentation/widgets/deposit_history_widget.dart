import 'package:bank_system/core/themeing/colors.dart';
import 'package:flutter/material.dart';

class DepositHistoryWidget extends StatelessWidget {
  final List<Map<String, String>> deposits;

  const DepositHistoryWidget({super.key, required this.deposits});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text('Recent Deposits', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        ...deposits.map((d) => Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: ListTile(
            leading: const Icon(Icons.account_balance_wallet_rounded, color: maincolor),
            title: Text('\$${d['amount']}'),
            subtitle: Text(d['date']!),
            trailing: Text(d['method']!),
          ),
        ))
      ],
    );
  }
}
