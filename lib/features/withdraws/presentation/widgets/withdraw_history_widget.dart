import 'package:bank_system/core/themeing/colors.dart';
import 'package:flutter/material.dart';

class WithdrawHistoryWidget extends StatelessWidget {
  final List<Map<String, String>> withdrawals;

  const WithdrawHistoryWidget({super.key, required this.withdrawals});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text('Recent Withdrawals', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 12),
        ...withdrawals.map((w) => Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 2,
          child: ListTile(
            leading: const Icon(Icons.money_off_rounded, color: maincolor),
            title: Text('\$${w['amount']}'),
            subtitle: Text(w['date']!),
            trailing: Text(w['method']!),
          ),
        ))
      ],
    );
  }
}
