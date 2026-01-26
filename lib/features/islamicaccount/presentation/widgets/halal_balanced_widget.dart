import 'package:bank_system/features/islamicaccount/presentation/pages/islamic_account_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HalalBalanceCard extends StatelessWidget {
  const HalalBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text("Halal Balance",
                  style: TextStyle(color: Colors.white70)),
              SizedBox(height: 8),
              Text(
                "\$ 18,750.00",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Chip(
                label: Text("Sharia Compliant"),
                backgroundColor: Colors.green,
                labelStyle: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 12),
              Text("Account Number",
                  style: TextStyle(color: Colors.white70)),
              Text("**** **** **** 1123",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          Positioned(
            right: 0,
            child: ElevatedButton(
              onPressed: () {
                GoRouter.of(context).push('/balance');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
              child: const Text("Show Balance"),
            ),
          )
        ],
      ),
    );
  }
}