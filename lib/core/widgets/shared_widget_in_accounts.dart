import 'package:bank_system/features/islamicaccount/presentation/pages/islamic_account_page.dart';
import 'package:flutter/material.dart';

class CategoriesBar extends StatelessWidget {
  const CategoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Categories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            CategoryItem(icon: Icons.send, label: "Transfer"),
            CategoryItem(icon: Icons.account_balance_wallet, label: "Top Up"),
            CategoryItem(icon: Icons.receipt_long, label: "Bills"),
            CategoryItem(icon: Icons.credit_card, label: "Cards"),
          ],
        ),
      ],
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: mainColor.withOpacity(0.1),
          child: Icon(icon, color: mainColor),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}