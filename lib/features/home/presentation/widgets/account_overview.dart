import 'package:bank_system/features/home/presentation/widgets/account_type_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const maincolor = Color(0xFF6366F1);

class AccountOverviewPage extends StatelessWidget {
  const AccountOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: maincolor,
        elevation: 0,
        title:  Text("Current Account", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Balance Card
           // Balance Card with Show Balance Button
Container(
  width: double.infinity,
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: maincolor,
    borderRadius: BorderRadius.circular(20),
  ),
  child: Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Available Balance",
            style: TextStyle(color: Colors.white70),
          ),
          SizedBox(height: 8),
          Text(
            "\$ 12,450.00",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Account Number",
            style: TextStyle(color: Colors.white70),
          ),
          Text(
            "**** **** **** 4589",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      Positioned(
        top: 0,
        right: 0,
        child: ElevatedButton(
          onPressed: () {
          GoRouter.of(context).push('/balance');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: maincolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          ),
          child: const Text(
            "Show Balance",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ],
  ),
),
const SizedBox(height: 20),
   const SizedBox(height: 20),
                    AccountTypeCard(
                      emoji: '💰',
                      title: 'Fixed Deposit',
                      subtitle: 'Save money with higher interest rates',
                      gradient: const LinearGradient(
                        colors: [Color(0xFF6366F1), Color(0xFF8B5CF6)],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
                    ),

            const SizedBox(height: 24),

            // Quick Actions
            const Text(
              "Quick Actions",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                _ActionItem(icon: Icons.send, label: "Transfer"),
                _ActionItem(icon: Icons.account_balance_wallet, label: "Top Up"),
                _ActionItem(icon: Icons.receipt_long, label: "Pay Bills"),
                _ActionItem(icon: Icons.credit_card, label: "Cards"),
              ],
            ),

            const SizedBox(height: 30),

            // Account Details
            const Text(
              "Account Details",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            _detailTile("Account Type", "Current Account"),
            _detailTile("Currency", "USD"),
            _detailTile("IBAN", "US12 4589 7894 5623 0147"),
            _detailTile("Status", "Active"),

            const SizedBox(height: 30),

            // Recent Activity
            const Text(
              "Recent Activity",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            const _TransactionTile(
              title: "Amazon",
              subtitle: "Online Shopping",
              amount: "- \$120.00",
            ),
            const _TransactionTile(
              title: "Salary",
              subtitle: "Company Transfer",
              amount: "+ \$2,500.00",
            ),
            const _TransactionTile(
              title: "Netflix",
              subtitle: "Subscription",
              amount: "- \$15.00",
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailTile(String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}

// Quick Action Item
class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ActionItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(icon, color: maincolor),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Transaction Tile
class _TransactionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final String amount;

  const _TransactionTile({
    required this.title,
    required this.subtitle,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(subtitle, style: const TextStyle(color: Colors.grey)),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              color: amount.contains('-') ? Colors.red : Colors.green,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
