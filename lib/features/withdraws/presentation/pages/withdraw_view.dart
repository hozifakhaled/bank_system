import 'package:bank_system/features/withdraws/presentation/widgets/withdraw_form_widget.dart';
import 'package:bank_system/features/withdraws/presentation/widgets/withdraw_header_widget.dart';
import 'package:bank_system/features/withdraws/presentation/widgets/withdraw_history_widget.dart';
import 'package:flutter/material.dart';

class WithdrawHomePage extends StatefulWidget {
  const WithdrawHomePage({super.key});

  @override
  State<WithdrawHomePage> createState() => _WithdrawHomePageState();
}

class _WithdrawHomePageState extends State<WithdrawHomePage> {
  final TextEditingController _amountController = TextEditingController();
  double balance = 5000.0;

  List<Map<String, String>> withdrawals = [
    {'amount': '200', 'date': 'Jan 1, 2026', 'method': 'Current Account'},
    {'amount': '150', 'date': 'Jan 10, 2026', 'method': 'Cash'},
  ];

  void _makeWithdraw() {
    if (_amountController.text.isEmpty) return;
    double withdrawAmount = double.tryParse(_amountController.text) ?? 0;
    if (withdrawAmount > balance) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Insufficient balance')),
      );
      return;
    }

    setState(() {
      withdrawals.insert(0, {
        'amount': _amountController.text,
        'date': 'Today',
        'method': 'Current Account',
      });
      balance -= withdrawAmount;
      _amountController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: maincolor,
        title: const Text('Withdraw', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WithdrawHeaderWidget(balance: balance),
            WithdrawFormWidget(amountController: _amountController, onWithdraw: _makeWithdraw),
            WithdrawHistoryWidget(withdrawals: withdrawals),
          ],
        ),
      ),
    );
  }
}
