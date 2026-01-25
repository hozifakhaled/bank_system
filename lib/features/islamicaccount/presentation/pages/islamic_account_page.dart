import 'package:bank_system/features/islamicaccount/presentation/widgets/halal_balanced_widget.dart';
import 'package:bank_system/features/islamicaccount/presentation/widgets/islamic_account_details.dart';
import 'package:bank_system/features/islamicaccount/presentation/widgets/islamic_services.dart';
import 'package:flutter/material.dart';

const mainColor = Color(0xFF6366F1);
const secondaryColor = Color(0xFFF5F6FA);

class IslamicAccountHomePage extends StatelessWidget {
  const IslamicAccountHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      appBar: AppBar(
        backgroundColor: mainColor,
        elevation: 0,
        title: const Text(
          "Islamic Account",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            HalalBalanceCard(),
            SizedBox(height: 24),
            QuickActions(),
            SizedBox(height: 30),
            IslamicServicesSection(),
            SizedBox(height: 30),
            AccountDetailsSection(),
            SizedBox(height: 30),
            RecentActivitySection(),
          ],
        ),
      ),
    );
  }
}


// ================= QUICK ACTIONS =================

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Quick Actions",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            ActionItem(icon: Icons.send, label: "Transfer"),
            ActionItem(icon: Icons.account_balance_wallet, label: "Top Up"),
            ActionItem(icon: Icons.receipt_long, label: "Pay Bills"),
            ActionItem(icon: Icons.credit_card, label: "Cards"),
          ],
        ),
      ],
    );
  }
}

class ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const ActionItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14)),
          child: Icon(icon, color: mainColor),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// ================= RECENT ACTIVITY =================

class RecentActivitySection extends StatelessWidget {
  const RecentActivitySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text("Recent Activity",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 12),
        TransactionTile(
            title: "Zakat Payment",
            subtitle: "Monthly Zakat",
            amount: "- \$320"),
        TransactionTile(
            title: "Salary",
            subtitle: "Halal Income",
            amount: "+ \$3,500"),
        TransactionTile(
            title: "Charity",
            subtitle: "Orphans Fund",
            amount: "- \$150"),
      ],
    );
  }
}

class TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;

  const TransactionTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(subtitle,
                  style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              color: amount.contains('-')
                  ? Colors.red
                  : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
