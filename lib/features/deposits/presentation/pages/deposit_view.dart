import 'package:bank_system/features/deposits/presentation/widgets/deposit_form_widget.dart';
import 'package:bank_system/features/deposits/presentation/widgets/deposit_header_widget.dart';
import 'package:bank_system/features/deposits/presentation/widgets/deposit_history_widget.dart';
import 'package:flutter/material.dart';

class DepositHomePage extends StatefulWidget {
  const DepositHomePage({super.key});

  @override
  State<DepositHomePage> createState() => _DepositHomePageState();
}

class _DepositHomePageState extends State<DepositHomePage> {
  final TextEditingController _amountController = TextEditingController();
  double balance = 5000.0;

  List<Map<String, String>> deposits = [
    {'amount': '200', 'date': 'Jan 1, 2026', 'method': 'Current Account'},
    {'amount': '150', 'date': 'Jan 10, 2026', 'method': 'Card'},
  ];

  void _makeDeposit() {
    if (_amountController.text.isEmpty) return;
    setState(() {
      deposits.insert(0, {
        'amount': _amountController.text,
        'date': 'Today',
        'method': 'Current Account'
      });
      balance += double.tryParse(_amountController.text) ?? 0;
      _amountController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      appBar: AppBar(
        backgroundColor: maincolor,
        title: const Text('Deposit', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DepositHeaderWidget(balance: balance),
            DepositFormWidget(amountController: _amountController, onDeposit: _makeDeposit),
            DepositHistoryWidget(deposits: deposits),
          ],
        ),
      ),
    );
  }
}
