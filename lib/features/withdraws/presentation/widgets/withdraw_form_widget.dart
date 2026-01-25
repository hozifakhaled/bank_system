import 'package:bank_system/core/themeing/colors.dart';
import 'package:flutter/material.dart';

class WithdrawFormWidget extends StatelessWidget {
  final TextEditingController amountController;
  final VoidCallback onWithdraw;

  const WithdrawFormWidget({
    super.key,
    required this.amountController,
    required this.onWithdraw,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text('Enter Withdraw Amount', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          controller: amountController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'e.g. 500',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
            prefixIcon: const Icon(Icons.money_rounded),
          ),
        ),
        const SizedBox(height: 24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onWithdraw,
            style: ElevatedButton.styleFrom(
              backgroundColor: maincolor,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text(
              'Confirm Withdraw',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
